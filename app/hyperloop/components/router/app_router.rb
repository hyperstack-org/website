
class AppRouter < Hyperloop::Router
  history :browser

  before_mount do
    `url = new URL(window.location.href)`
    redirect = `url.searchParams.get('redirect')`
    if redirect
      pathname = `url.searchParams.get('pathname')`
      hash = `url.searchParams.get('hash')`
      history.push "#{pathname}##{hash}"
    end
  end

  route do
    DIV {
      Switch do
        Route('/', exact: true, mounts: HomePage)
        Route('/docs', exact: true, mounts: DocsPage)
        Route('/docs/:section', exact: true, mounts: DocsPage)
        Route('/docs/:section/:page', exact: true, mounts: DocsPage)
        Route('/docs/:section/:page/:slug', exact: false, mounts: DocsPage)
        Route('/searchresult', exact: false, mounts: SearchResultPage)
      end
    }
  end


end
