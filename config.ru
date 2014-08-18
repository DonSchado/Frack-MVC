$LOAD_PATH << '.'

require 'rack'
require 'tilt'

module Frack
  class Application
    class << self
      def call(env)
        if env['PATH_INFO'] == '/'
          @users = ['Anthony Stark', 'Peter Parker', 'Bruce Wayne']
          Rack::Response.new(render 'users/index')
        else
          Rack::Response.new('Not found', 404)
        end
      end

      def render(view)
        render_template('layouts/application') do
          render_template(view)
        end
      end

      def render_template(path, &block)
        Tilt.new("app/views/#{path}.html.erb").render(self, &block)
      end
    end
  end
end

# use Rack::CommonLogger
use Rack::Static, root: 'public', urls: ['/images', '/js', '/css'] #mkdir -p public/{css,images,js}
use Rack::ContentLength
run Frack::Application
