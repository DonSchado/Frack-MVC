module Frack
  class Application
    class << self
      def call(env)
        controller = Object.const_get(env['controller'].capitalize + 'Controller')
        Rack::Response.new(controller.new.send(env['action']))
      end
    end
  end
end
