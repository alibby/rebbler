
class Checker
  module RBL
    class Loader
      def self.file= file
        @@filename = file
      end

      def self.load
        @@filename ||= File.join(File.dirname(__FILE__), '..', 'rbls.txt')
        File.readlines(@@filename).sort
      end
    end
  end

  attr_accessor :ip

  def initialize(to_check)
    @ip = resolve_to_ip(to_check)
  end

  def resolve_to_ip name_to_lookup
    begin
      IPAddr.new(name_to_lookup)
    rescue ArgumentError => e
      Resolver(name_to_lookup).answer.first.address
    end
  end

  def check(&blk)
    rbls.each do |line|
      rbl_domain = line.strip
      name = name_to_lookup rbl_domain

      answer = resolver.query(name).answer
      if answer.length > 0
        rbl_response_code = answer.first.address
        text = resolver.query(name, Net::DNS::TXT).answer
        rbl_txt_message = text.first.nil? ? "" : text.first.txt
        ttl = text.first.nil? ? 0 : text.first.ttl

        yield({ rbl: rbl_domain, ttl: ttl, result: rbl_response_code, message: rbl_txt_message })
      else
        yield({ rbl: rbl_domain, ttl: ttl, result: "", message: 'Not Listed' })
      end
    end
  end

  def rbls
    @@rbls ||= RBL::Loader.load
  end

  def name_to_lookup(rbl_domain)
    ip.reverse.gsub(/in-addr.arpa/, rbl_domain)
  end

  def resolver
    @resolver ||= Net::DNS::Resolver.new(:nameservers => ['8.8.8.8','8.8.4.4'] * 10, :log_file => nil)
  end
end

