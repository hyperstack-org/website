class ReactCodeMirror < Hyperstack::Component
  imports 'CodeMirror'
end


class CodeMirror < Hyperstack::Component
  param :code
  state code: ""

  before_mount do
    mutate.code params.code
  end

  render do

    

    DIV(class: 'runable_code_blocks') do
      
      Sem.Segment(class: 'codeeditor-header', inverted: true) {
        Sem.Icon(name: :edit)
        "Code editor"
      }

      mirror

      unless compile && evaluate && render_component
        Sem.Message(negative: true) {
          PRE { state.compile_error }
        }
      end
    end
  end

  def compile
    begin
      ret = true
      @compiled_code = Opal::Compiler.new(state.code).compile
    rescue Exception => e
      message = e.message
      mutate.compile_error message.gsub 'An error occurred while compiling: (file)', 'Oops...'
      ret = false
    end
    ret
  end

  def evaluate
    begin
      ret = true
      `eval(#{@compiled_code})`
    rescue Exception => e
      mutate.compile_error "Oops... \n\n #{e.message}"
      ret = false
    end
    ret
  end

  def render_component
    begin
      ret = true
      Sem.Message {
        DIV(id: 'result') {
          # ALL OF THE FORMS BELOW WORK, BUT NONE RAISE AN EXCEPTION
          # MyComp()
          React.create_element( Module.const_get(component_name), {})
          # `eval(React.createElement( MyComp, {}, null))`
          # `React.createElement( MyComp, {}, null)`
        }
      }
    rescue Exception => e
      mutate.compile_error "React unhappy... \n\n #{e.message}"
      ret = false
    end
    ret
  end

  def component_name
    elements = state.code.split ' '
    elements[ (elements.index('Hyperstack::Component') -2) ]
  end

  def mirror
    options = {
      lineNumbers: false,
      mode: :ruby,
      theme: 'one-dark',
      indentUnit: 2,
      matchBrackets: true
    }
    ReactCodeMirror(options: options.to_n, value: state.code, onChange: lambda { |value| mutate.code value })
  end

end
