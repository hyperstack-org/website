class HtmlOutputTab < HyperComponent
  param :element_id
  param :last_html # we need this as the element might not be rendered at the moment

  render(DIV) do
    puts @Last_html
    html = ::Element.find("##{@ElementId}").html
    html = @LastHtml if html == ""
    html_code = `hljs.highlightAuto(#{html}).value`
    CODE(class: 'lang-html hljs') do
       DIV( dangerously_set_inner_HTML: { __html: html_code } )
    end
  end

end
