class HtmlOutputTab < Hyperloop::Component
  param :element_id

  render(DIV) do
    render_html
  end

  def render_html
    if params.element_id
      html = Element.find("##{params.element_id}").html
      html_code = `hljs.highlightAuto(#{html}).value`
      CODE(class: 'lang-html hljs') do
         DIV( dangerously_set_inner_HTML: { __html: html_code } )
       end
    else
      Sem.Message(negative: true) do
        H3 { state.compile_error_heading }
        P { state.compile_error_message }
      end
    end
  end

end
