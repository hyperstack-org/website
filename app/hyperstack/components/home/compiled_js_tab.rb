class CompiledJsTab < HyperComponent
  param :opal_code

  render(DIV) do
    opal_code_html
  end

  def opal_code_html
    if @OpalCode
      html_code = `hljs.highlightAuto(#{@OpalCode}).value`
      PRE(class: 'code pre-md-code') do
        CODE(class: 'lang-javascript hljs small-code-font') do
           DIV( dangerously_set_inner_HTML: { __html: html_code } )
         end
      end
    else
      Sem.Message(negative: true) do
        H3 { "Compile error" }
      end
    end
  end

end
