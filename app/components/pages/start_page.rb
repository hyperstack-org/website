class StartPage < Hyperloop::Router::Component

  render(DIV) do
    PageRender(section_name: "start",
               display_title: "Get started",
               history: history,
               location: location)
  end
end
