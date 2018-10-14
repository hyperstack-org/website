require 'helpers/helpers'

class AppMenu < Hyperloop::Component
  param section: ''
  param :history

  render(DIV, class: 'gray-background') do
    Sem.Container(className: 'Top') do
      Sem.Menu(secondary: true, className: 'gray-background') do
        Sem.MenuItem do
          A { SPAN(class: 'top-nav') {'Start'} }.on(:click) { params.history.push "/#{AppStore.version}" }
        end
        Sem.MenuItem do
           A { SPAN(class: 'top-nav') {'Docs'} }.on(:click) { params.history.push "/#{AppStore.version}/docs" }
         end
        Sem.MenuItem do
          A { SPAN(class: 'top-nav') {'Github'} }.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
        end
        Sem.MenuItem do
           A { SPAN(class: 'top-nav') {'Chat'} }.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
         end
         Sem.MenuItem(position: 'right') do
           IFRAME(class: 'github',
             src: 'http://ghbtns.com/github-btn.html?user=hyperstack-org&repo=hyperstack&type=watch&count=true',
             frameBorder: '0', scrolling: '0', width: '100', height: '20')
         end
      end
    end
  end

  # render do
  #   DIV(class: 'following bar fixed') do
  #     DIV(class: 'ui page grid') do
  #       DIV(class: 'column') do
  #         logo_menu_item
  #         DIV(class: 'ui large secondary network menu') do
  #           docs_menu_item
  #           github_menu_item
  #           chat_menu_item
  #           search_control
  #           # github_stars
  #           # edge_badge
  #           # edge_or_master_menu_item
  #         end
  #       end
  #     end
  #   end
  # end

  def logo_menu_item
    DIV(class: 'ui logo shape') do
      DIV(class: 'sides') do
        DIV(class: 'active learn side') do
          Link("/#{AppStore.version}") {
            IMG(class: 'ui image', src: '/images/hyperloop-logo-small-pink.png')
          }
        end
      end
    end
  end

  def docs_menu_item
    Link("/#{AppStore.version}/docs", class: 'additional item visible') { 'Docs' }
  end

  def github_menu_item
    A(href: 'https://github.com/hyperstack-org', 'data-site': 'ui', class: 'additional item visible') { 'Github' }
  end

  def chat_menu_item
    A(href: 'https://gitter.im/ruby-hyperloop/chat', 'data-site': 'ui', class: 'additional item visible') { 'Chat' }
  end

  def search_control
    if (params.section != 'home')
      Sem.MenuItem {
        SiteSearch(section: params.section, history: history, location: location)
      }
      Sem.MenuItem {
        if (!(SearchEngineStore.querystring.empty?) && !(location.pathname == "/searchresult"))
          Sem.Button(color: 'red') {"See results for: { #{SearchEngineStore.querystring} }"}.on(:click) do
            params.history.push "/searchresult"
          end
        end
      }
    end
  end

  # def edge_or_master_menu_item
  #   if AppStore.version == 'hs1'
  #     A(href: 'https://hyperstack.org/hs2', 'data-site': 'ui', class: 'additional item visible') { 'Go to HS2' }
  #   else
  #     A(href: 'https://hyperstack.org/hs1', 'data-site': 'ui', class: 'additional item visible') { 'Go to HS1' }
  #   end
  # end

  # def edge_badge
  #   Sem.MenuItem {
  #     label = Sem.Label(color: 'red', horizontal: true, size: :huge) { 'alpha' }.as_node
  #     Sem.Popup(trigger: label.to_n, position: 'bottom right', content: 'This project is in alpha and the code and docs are work in progress.')
  #   }
  # end

  def github_stars
    Sem.MenuItem {
      IFRAME(class: 'github',
        src: 'http://ghbtns.com/github-btn.html?user=ruby-hyperloop&repo=hyper-react&type=watch&count=true',
        frameBorder: '0', scrolling: '0', width: '100', height: '20')
    }
  end
end
