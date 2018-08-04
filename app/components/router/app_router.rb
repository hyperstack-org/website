
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
        Route('/start', exact: false, mounts: StartPage)
        Route('/installation', exact: false, mounts: InstallationPage)
        Route('/tutorials', exact: false, mounts: TutorialsPage)
        Route('/gems', exact: false, mounts: GemsPage)
        Route('/tools', exact: false, mounts: ToolsPage)
        Route('/docs', exact: false, mounts: DocsPage)
        Route('/searchresult', exact: false, mounts: SearchResultPage)
      end
    }
  end


end
