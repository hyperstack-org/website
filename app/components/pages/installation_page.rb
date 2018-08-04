class InstallationPage < Hyperloop::Router::Component

  render(DIV) do
    PageRender(section_name: "installation",
               display_title: "Installation",
               history: history,
               location: location)
  end
end
