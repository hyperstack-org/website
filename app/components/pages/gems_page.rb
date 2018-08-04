class GemsPage < Hyperloop::Router::Component

  render(DIV) do
    PageRender(section_name: "gems",
               display_title: "Hyperloop Gems",
               history: history,
               location: location)
  end
end
