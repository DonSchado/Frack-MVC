module Frack
  class Application
    class << self
      attr_accessor :env

      def call(env)
        self.env = env
        Rack::Response.new(*dispatch)
      end

      def dispatch
        controller.new(env).process_action(env['action'])
      end

      def controller
        Object.const_get(env['controller'].capitalize + 'Controller')
      end
    end
  end
end
