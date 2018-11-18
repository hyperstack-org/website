class LiveCodeSegment < HyperComponent

  param :content
  param :code

  before_mount do
    @ruby_code = @Code
    @random = random_key
  end

  render(DIV, class: 'block') do
    Sem.Divider(hidden: true)
    Sem.Grid(columns: 2, relaxed: true, padded: false, container: false) do
      Sem.GridColumn(width: 4, className: 'tight-box') { @Content }
      Sem.GridColumn(width: 12, className: 'tight-box') do
        Sem.Container(className: 'white-background outline-box') do
          tabs
        end
      end
    end
    Sem.Divider(hidden: true)
  end

  def code_editor_and_results
    Sem.Grid(columns: 2, relaxed: false, padded: false, container: true) do
      Sem.GridColumn(width: 12, className: 'tight-box') { code_mirror_editor }
      Sem.GridColumn(width: 4) do
        unless compile && evaluate && render_component
          Sem.Message(negative: true) do
            H3 { @compile_error_heading }
            P { @compile_error_message }
          end
        end
      end
    end
  end

  def tabs
    live_code = code_editor_and_results.as_node
    html = ::Element.find("#result-#{@random}").html
    compiled_js = CompiledJsTab(opal_code: @compiled_code).as_node
    html_output = HtmlOutputTab(element_id: "result-#{@random}").as_node

    panes = []
    panes.concat [ { menuItem: 'Live Ruby',   render: -> { live_code.to_n } },
                   { menuItem: 'Generated JS', render: -> { compiled_js.to_n } },
                   { menuItem: 'HTML output', render: -> { html_output.to_n } }
    ]

    menu = { secondary: false, pointing: true }
    Sem.Tab(menu: menu.to_n, panes: panes.to_n )

  end

  def code_mirror_editor
    options = {
      lineNumbers: false,
      mode: :ruby,
      theme: 'one-dark',
      indentUnit: 2,
      matchBrackets: true
    }
    ReactCodeMirror(options: options.to_n, value: @ruby_code.to_n,
      onChange: lambda { |value| mutate(@ruby_code = value) })
  end

  def compile
    begin
      # @compiled_code = Opal::Compiler.new(@ruby_code).compile
      @compiled_code = Opal::compile(@ruby_code)
    rescue Exception => e
      @compile_error_heading = "Compile error"
      @compile_error_message = e.message
      return false
    end
    true
  end

  def evaluate
    begin
      `eval(#{@compiled_code})`
    rescue Exception => e
      @compiled_code = nil
      @compile_error_heading = "Evaluation error"
      @compile_error_message = e.message
      return false
    end
    true
  end

  def render_component
    begin
      DIV(id: "result-#{@random}") do
        RenderComponent(component_name: component_name, random_key: random_key)
      end
    rescue Exception => e
      @compile_error_heading = "Invalid component error"
      @compile_error_message = e.message
      return false
    end
    true
  end

  def random_key
    rand(2**256).to_s(36)[0..7].to_s
  end

  def component_name
    elements = @ruby_code.split ' '
    elements[ (elements.index('HyperComponent') -2) ]
  end

end
