require 'helpers/is_edge'

class AppMenu < Hyperloop::Router::Component
  param :section

  render do
    DIV(class: 'following bar fixed') do
      DIV(class: 'ui page grid') do
        DIV(class: 'column') do

          DIV(class: 'ui logo shape') do
            DIV(class: 'sides') do
              DIV(class: 'active learn side') do
                Link('/') { 
                  IMG(class: 'ui image', src: '/images/hyperloop-logo-small-pink.png')
                }
              end
            end
          end

          DIV(class: 'ui inverted right floated secondary menu') do
            DIV(class: 'ui language floating dropdown link item', id: 'languages') do
              I(class: 'world icon')
              DIV(class: 'text') { 'English' }
              DIV(class: 'menu')
            end
          end

          DIV(class: 'ui large secondary network menu') do
            # A(class: 'view-ui item') do
            #   I(class: 'sidebar icon')
            #   " Menu\n        "
            # end.on(:click) { SidebarStore.toggle }

            Link('/docs', class: 'additional item visible') { 'Docs' }
            A(href: 'https://github.com/hyperstack-org', 'data-site': 'ui', class: 'additional item visible') { 'Github' }
            A(href: 'https://gitter.im/ruby-hyperloop/chat', 'data-site': 'ui', class: 'additional item visible') { 'Chat' }

            if (params.section != 'home')
              Sem.MenuItem {
                SiteSearch(section: params.section, history: history, location: location)
              }
              Sem.MenuItem {
                if (!(SearchEngineStore.querystring.empty?) && !(location.pathname == "/searchresult"))
                  Sem.Button(color: 'pink') {"See results for: { #{SearchEngineStore.querystring} }"}.on(:click) do
                    params.history.push "/searchresult"
                  end
                end
              }
            end
            # enabled when we come out of alpha
            # Sem.MenuItem {
              # IFRAME(class: 'github', src: 'http://ghbtns.com/github-btn.html?user=ruby-hyperloop&repo=hyper-react&type=watch&count=true', frameBorder: '0', scrolling: '0', width: '100', height: '20')
            # }
            Sem.MenuItem {
              message = is_edge? ? 'edge of alpha' : 'alpha'
              Sem.Label(color: 'red', horizontal: true, size: :huge) { message }
            }
          end
        end
      end
    end
  end
end
