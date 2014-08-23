module Frack
  class BaseController
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def params
      @params ||= Rack::Utils.parse_nested_query(env['QUERY_STRING'])
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
      Dir[File.join('app', 'views', "#{path}.html.*")].first
    end

    def layout
      File.join('layouts', 'application')
    end

    def controller_action
      File.join(env['controller'], env['action'])
    end

    def redirect_to path
      body = %Q(Redirecting to <a href="#{path}">#{path}</a>)
      header = { "Location" => path }
      [body, 301, header]
    end
  end
end
