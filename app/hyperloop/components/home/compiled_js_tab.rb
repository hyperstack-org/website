class CompiledJsTab < Hyperloop::Component
  param :opal_code

  render(DIV) do
    html_code = `hljs.highlightAuto(#{params.opal_code || ""}).value`
    PRE(class: 'code pre-md-code') do
      CODE(class: 'lang-javascript hljs small-code-font') do
         DIV( dangerously_set_inner_HTML: { __html: html_code } )
       end
    end
  end
end
