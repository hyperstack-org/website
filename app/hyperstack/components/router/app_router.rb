class AppRouter < HyperComponent
  include Hyperstack::Router
  history :browser

  render do
    unless @store_booted
      version = location.pathname.downcase.include?('edge') ? 'edge' : 'edge'
      local_docs = ( `window.location.search.slice(1)`.include?('local_docs') ? true : false )
      AppStore.boot version, local_docs, history
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
