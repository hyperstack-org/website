module Rack
  class Custom404
    def initialize(app, html_body)
      @app = app
      @html_body = html_body
    end

    def call(env)
      status_code, headers, body = app.call(env)

      if status_code == 404
        [301, { "Content-Type" => "text/html" }, [html_body]]
      else
        [status_code, headers, body]
      end
    end

    private

    attr_reader :app, :html_body
  end
end
