require 'sinatra/base'
require "sinatra/reloader" if Sinatra::Base.development?
require 'sinatra-websocket'
require 'haml'
require 'json'
require 'rbconfig'

class App < Sinatra::Base
  set :server, 'thin'
  set :root, File.join(File.dirname(__FILE__), '..')


  get '/', provides: 'html' do
    haml :index
  end

  get '/req' do
    return unless request.websocket?

    request.websocket do |ws|
      ws.onopen do
      end

      ws.onmessage do |msg|
        thing = Thread.new do
          begin
            checker = Checker.new msg
            checker.check do |response|
              EM.next_tick { ws.send(response.to_json + "\n\n") }
            end
          rescue Exception => e
            puts e
            raise e
          end
          Thread.self.join
          ws.close()
        end
        thing.run
      end

      ws.onclose do
      end
    end
  end
end
