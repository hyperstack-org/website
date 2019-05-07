require 'opal/compiler'

class LiveCodeSegment < HyperComponent

  param :content
  param :code

  before_mount do
    @ruby_code = @Code
    @random = random_key
    @tab_value = 0
  end

  after_mount do
    `$("#appear").delay(200).animate({"opacity": "1"}, 700);`
  end

  render(DIV,class: 'block gray-text') do
    Mui.Grid(container:true, justify: :center,className: :grow, spacing: 8) do
      Mui.Grid(item: true, xs: 8, sm: 8, md: 6) do
        @Content
      end
    end
    BR{}

    Mui.Grid(container:true, justify: :center,className: :grow, spacing: 8) do
      Mui.Grid(item: true,xs: 10, sm: 10, md: 10, lg: 8, xl: 8) do
        Mui.Card() do
          Mui.Grid(container:true, justify: :center,className: :grow, spacing: 8) do

            Mui.Grid(item: true,xs: 12, sm: 12, md: 8, lg: 8, xl: 8) do
              Mui.Tabs(value: @tab_value) do
                Mui.Tab(label: "Live Ruby") {}
                Mui.Tab(label: "Generated JS") {}
              end.on(:change) do |evt, value|
                tab value
              end

              Mui.CardContent(class:'grey') do
                Mui.Typography(variant: :h5, component: :h3) do
                  tab_content
                end
              end
            end
            Mui.Grid(item: true,xs: 12, sm: 12, md: 4, lg: 4, xl:4) do
              Mui.CardContent(class: 'clear-background') do
                unless compile && evaluate && render_component
                  Sem.Message(negative: true) do
                    H3 { @compile_error_heading }
                    P { @compile_error_message }
                  end
                end
              end
            end
          end
        end
      end
    end
    BR{}

  end


  def tab(value)
    mutate @tab_value = value
  end

  def tab_content
    return code_editor_and_results.as_node if @tab_value == 0
    CompiledJsTab(opal_code: @compiled_code).as_node if @tab_value == 1
  end

  def code_editor_and_results
     code_mirror_editor
  end

  def tabs
    live_code = code_editor_and_results.as_node
    html = ::Element.find("#result-#{@random}").html
    compiled_js = CompiledJsTab(opal_code: @compiled_code).as_node
    # html_output = HtmlOutputTab(element_id: "result-#{@random}").as_node

    panes = [live_code]
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

