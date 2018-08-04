class ToolsPage < Hyperloop::Router::Component

  render(DIV) do
    PageRender(section_name: "tools",
               display_title: "Tools",
               history: history,
               location: location)
  end
end
