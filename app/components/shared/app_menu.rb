class AppMenu < Hyperloop::Router::Component

  param :section

  render do

    DIV(class: 'following bar fixed') do
      DIV(class: 'ui page grid') do
        DIV(class: 'column') do

          DIV(class: 'ui logo shape') do
            DIV(class: 'sides') do
              DIV(class: 'active learn side') do
                IMG(class: 'ui image', src: 'dist/images/hyperloop-logo-small-pink.png')
                #Link('/docs', class: 'item') { 'DOCUMENTATION' }

              end

            end
          end

          DIV(class: 'ui inverted right floated secondary menu') do
            # DIV(class: 'item') do
            #   IFRAME(class: 'github', src: 'http://ghbtns.com/github-btn.html?user=ruby-hyperloop&repo=hyperloop&type=watch&count=true', allowTransparency: 'true', frameBorder: '0', scrolling: '0', width: '100', height: '20')
            # end
            DIV(class: 'ui language floating dropdown link item', id: 'languages') do
              I(class: 'world icon')
              DIV(class: 'text') { 'English' }
              DIV(class: 'menu')
            end
          end

          DIV(class: 'ui large secondary network menu') do
            A(class: 'view-ui item') do
              I(class: 'sidebar icon')
              " Menu\n        "
            end.on(:click) {
              SidebarStore.toggle
            }
            A(href: 'https://github.com/ruby-hyperloop', 'data-site': 'ui', class: 'additional item visible') { 'Github' }
            A(href: 'https://gitter.im/ruby-hyperloop/chat', 'data-site': 'ui', class: 'additional item visible') { 'Gitter chat' }

            if (params.section != 'home')
              Sem.MenuItem {
                SiteSearch(section: params.section, history: history, location: location)
              }

              Sem.MenuItem {
                #puts "MATCH #{location.pathname == "/searchresult"}"
                if (!(SearchEngineStore.querystring.empty?) && !(location.pathname == "/searchresult"))
                  Sem.Button(color: 'pink') {"See results for: { #{SearchEngineStore.querystring} }"}.on(:click) do
                    params.history.push "/searchresult"
                  end
                end
              }

            end

            Sem.MenuItem {
              IFRAME(class: 'github', src: 'http://ghbtns.com/github-btn.html?user=ruby-hyperloop&repo=hyperloop&type=watch&count=true', frameBorder: '0', scrolling: '0', width: '100', height: '20')
            }

          end

        end
      end
    end
  #   Sem.Menu(fixed: :top, inverted: false) do
  #     sidebar_toggle
  #     home
  #     start
  #     installation
  #     tutorials
  #     gems
  #     tools
  #     docs
  #     search
  #   end
  # end

  # def sidebar_toggle
  #   A(class: 'item', id: 'togglemenu') do
  #     Sem.Icon(name: 'sidebar')
  #   end.on(:click) {
  #     SidebarStore.toggle
  #   }
  # end

  # def home
  #   Sem.MenuItem {
  #     Link('/') { 'HOME' }
  #   }
  # end

  # def start
  #   Sem.MenuItem {
  #     Link('/start') { 'START' }
  #   }
  # end

  # def installation
  #   Sem.MenuItem {
  #     Link('/installation') { 'INSTALLATION' }
  #   }
  # end

  # def tutorials
  #   Sem.MenuItem {
  #     Link('/tutorials') { 'TUTORIALS' }
  #   }
  # end

  # def gems
  #   Sem.MenuItem {
  #     Link('/gems') { 'GEMS' }
  #   }
  # end

  # def tools
  #   Sem.MenuItem {
  #     Link('/tools') { 'TOOLS' }
  #   }
  # end

  # def docs
  #   Sem.MenuItem {
  #     Link('/docs') { 'DOCS' }
  #   }
  # end

  # def search
  #   Sem.MenuMenu(position: :right) {
  #     Sem.MenuItem {
  #       SiteSearch()
  #     }
  #   }
  # end

  end

end
