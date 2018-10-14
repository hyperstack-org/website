class CompiledJsTab < Hyperloop::Component
  param :opal_code

  render(DIV) do
    opal_code_html
  end

  def opal_code_html
    if params.opal_code
      html_code = `hljs.highlightAuto(#{params.opal_code}).value`
      PRE(class: 'code pre-md-code') do
        CODE(class: 'lang-javascript hljs small-code-font') do
           DIV( dangerously_set_inner_HTML: { __html: html_code } )
         end
      end
    else
      Sem.Message(negative: true) do
        H3 { state.compile_error_heading }
        P { state.compile_error_message }
      end
    end
  end

end
