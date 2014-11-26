Gem::Specification.new do |s|
  s.name        = 'rebbler'
  s.version     = '0.0.2'
  s.date        = '2014-11-25'
  s.summary     = "DNS Block List Lookup Tool"
  s.description = s.summary
  s.authors     = ["Andrew Libby"]
  s.email       = 'alibby@xforty.com'
  s.files       = ["rbls.txt", "views/index.haml", 'lib/app.rb', 'lib/checker.rb']
  s.executables << 'rebbler'
  s.homepage    = 'http://github.com/xforty/rebbler'
  s.license     = 'MIT'
  s.add_runtime_dependency 'sinatra', '1.4.5'
  s.add_runtime_dependency 'sinatra-contrib', '1.4.2'
  s.add_runtime_dependency 'sinatra-websocket', '0.3.0'
  s.add_runtime_dependency 'net-dns', '0.8.0'
  s.add_runtime_dependency 'thin', '1.6.3'
  s.add_runtime_dependency 'haml', '4.0.3'
end
