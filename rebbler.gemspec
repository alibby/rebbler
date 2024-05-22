Gem::Specification.new do |s|
  s.name        = 'rebbler'
  s.version     = '0.0.5'
  s.date        = '2014-12-17'
  s.summary     = "DNS Block List Lookup Tool"
  s.description = s.summary
  s.authors     = ["Andrew Libby"]
  s.email       = 'alibby@andylibby.org'
  s.files       = ["rbls.txt", "views/index.haml", 'lib/app.rb', 'lib/checker.rb']
  s.executables << 'rebbler'
  s.homepage    = 'http://github.com/alibby/rebbler'
  s.license     = 'MIT'
  s.add_runtime_dependency 'sinatra', '~> 3.2.0'
  s.add_runtime_dependency 'sinatra-contrib'
  s.add_runtime_dependency 'sinatra-websocket'
  s.add_runtime_dependency 'net-dns'
  s.add_runtime_dependency 'thin'
  s.add_runtime_dependency 'haml'
end
