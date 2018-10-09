class DocHeading < Hyperloop::Component
  param :history
  param :text
  param :path

  render do
    # Sem.Visibility(
    #   onTopVisible: -> {  puts "onTopVisible #{params.id}" },
    #   continuous: true
    #   # context: `document.getElementById('alfie')`
    # ) do
    #   P { "render doc heding #{params.id}"}
    # end
    SPAN { params.text.to_s }.on(:click) do
      params.history.push params.path
    end
  end
end
