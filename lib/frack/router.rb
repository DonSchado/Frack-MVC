module Frack
  class Router
    attr_reader :app

    ROUTES = {
      '/' => { 'controller' => 'users', 'action' => 'index' }
    }

    def initialize(app)
      @app = app
    end

    def call(env)
      if (mapping = ROUTES[env['PATH_INFO']])
        env.merge!(mapping)
        app.call(env)
      else
        Rack::Response.new('Not found', 404)
      end
    end
  end
end
