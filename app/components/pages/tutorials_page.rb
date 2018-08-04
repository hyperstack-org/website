class TutorialsPage < Hyperloop::Router::Component
  render(DIV) do
    PageRender(section_name: "tutorials",
               display_title: "Tutorials",
               history: history,
               location: location)
  end
end
