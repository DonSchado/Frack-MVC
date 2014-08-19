module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view=controller_action)
      render_template(layout) do
        render_template(view)
      end
    end

    def render_template(path, &block)
      Tilt.new(file(path)).render(self, &block)
    end

    def file(path)
      File.join('app', 'views', "#{path}.html.erb")
    end

    def layout
      File.join('layouts', 'application')
    end

    def controller_action
      File.join(env['controller'], env['action'])
    end
  end
end
