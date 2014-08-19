$LOAD_PATH << '.'

require 'lib/frack'
require 'app/controllers/users_controller'
require 'app/models/user'

# use Rack::CommonLogger
use Rack::Static, root: 'public', urls: ['/images', '/js', '/css']
use Rack::ContentLength
use Frack::Router do
  match '/' => 'users#index'
end

run Frack::Application
