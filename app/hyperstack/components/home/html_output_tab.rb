class HtmlOutputTab < HyperComponent
  param :element_id

  render(DIV) do
    html = ::Element.find("##{@ElementId}").html
    html_code = `hljs.highlightAuto(#{html}).value`
    CODE(class: 'lang-html hljs') do
       DIV( dangerously_set_inner_HTML: { __html: html_code } )
    end
  end
end
