# class PageRender < Hyperstack::Component
#   param :section_name
#   param :display_title
#   param :history
#   param :location
#
#   before_mount do
#     SidebarStore.hide
#   end
#
#   render(DIV) do
#     sidebar = PageToc(history: params.history, location: params.location, section_name: params.section_name).as_node
#     body = PageBody(section_name: params.section_name).as_node
#
#     PageLayout(sidebar_component: sidebar,
#               body_component: body,
#               page_title: params.display_title,
#               section: params.section_name,
#               loaded: AppStore.section_stores[params.section_name].loaded?,
#               history: params.history,
#               location: params.location)
#   end
# end
