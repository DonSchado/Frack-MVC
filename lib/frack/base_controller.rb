module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view=controller_action)
      render_template('layouts/application') do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new("app/views/#{path}.html.erb").render(self, &block)
    end

    def controller_action
      File.join(env['controller'], env['action'])
    end
  end
end
