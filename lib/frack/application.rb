module Frack
  class Application
    class << self
      def call(env)
        if env['PATH_INFO'] == '/'
          Rack::Response.new(UsersController.new.index)
        else
          Rack::Response.new('Not found', 404)
        end
      end
    end
  end
end
