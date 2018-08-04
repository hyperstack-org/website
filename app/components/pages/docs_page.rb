class DocsPage < Hyperloop::Router::Component

  render(DIV) do
    PageRender(section_name: "docs",
               display_title: "Documentation",
               history: history,
               location: location)
  end
end
