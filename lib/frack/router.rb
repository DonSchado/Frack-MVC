module Frack
  class Router
    attr_reader :app, :routes

    def initialize(app, &block)
      @app = app
      @routes = RouteBuilder.new(&block).routes
    end

    def call(env)
      if (mapping = routes[env['PATH_INFO']])
        env.merge!(controller_action(mapping))
        app.call(env)
      else
        Rack::Response.new('Not found', 404)
      end
    end

    def controller_action(mapping)
      controller, action = mapping.split('#')
      { 'controller' => controller, 'action' => action }
    end
  end

  class RouteBuilder
    attr_reader :routes

    def initialize(routes={}, &block)
      @routes = routes
      instance_exec(&block) if block_given?
    end

    def match(route)
      self.routes.merge!(route)
    end
  end
end
