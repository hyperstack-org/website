class AppRouter < Hyperloop::Router
  history :browser

  route do
    unless @store_booted
      version = location.pathname.downcase.include?('hs2') ? 'hs2' : 'hs1'
      AppStore.boot version
      @store_booted = true
    end

    Switch do
      Route('/', exact: true, mounts: HomePage)
      Route('/searchresult', exact: false, mounts: SearchResultPage)
      Route('/:version', exact: true, mounts: HomePage)
      Route('/:version/docs', exact: true, mounts: DocsPage)
      Route('/:version/docs/:section_name', exact: true, mounts: DocsPage)
      Route('/:version/docs/:section_name/:page_name', exact: true, mounts: DocsPage)
    end
  end
end
