class PageRender < Hyperloop::Component
  param :section_name
  param :display_title
  param :history
  param :location

  before_mount do
    SidebarStore.hide
  end

  render(DIV) do
    sidebar = PageToc(history: params.history, location: params.location, section: params.section_name).as_node
    body = PageBody(section: params.section_name).as_node
    
    PageLayout(sidebar_component: sidebar,
              body_component: body,
              page_title: params.display_title,
              section: params.section_name,
              loaded: SiteStore.sections[params.section_name].loaded?,
              history: params.history,
              location: params.location)
  end
end
