class AppRouter < Hyperloop::Router
  history :browser

  route do
    Switch do
      Route('/', exact: true, mounts: HomePage)
      Route('/docs', exact: true, mounts: DocsPage)
      Route('/docs/:section_name', exact: true, mounts: DocsPage)
      Route('/docs/:section_name/:page_name', exact: true, mounts: DocsPage)
      Route('/searchresult', exact: false, mounts: SearchResultPage)
    end
  end
end
