
class SearchResultPage < Hyperloop::Component

  # after_mount do
  #   Element['html, body'].animate({
  #            scrollTop: 0
  #          }, :slow)
  # end

  render do

    section = "docs"
    displaytitle = "Search results for { #{SearchEngineStore.querystring} }"

    sidebar = SearchResultSidebar(history: history, location: location, section: section).as_node
    body = SearchResultBody(history: history, location: location, section: section).as_node

    PageLayout(sidebar_component: sidebar,
              body_component: body,
              page_title: displaytitle,
              section: section,
              loaded: true,
              history: history,
              location: location)

  end


end
