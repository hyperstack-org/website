class DocHeading < Hyperloop::Component
  param :id

  render(DIV) do
    # Sem.Visibility(
    #   onTopVisible: -> {  puts "onTopVisible #{params.id}" },
    #   continuous: true
    #   # context: `document.getElementById('alfie')`
    # ) do
    #   P { "render doc heding #{params.id}"}
    # end
    P { "DocHerading I am #{params.id}"}
  end
end
