require 'helpers/helpers'

# hide mobile-menu on click outside
Window.on(:click) do|e|
  ed = e.target.to_n
  if ed.attr('id') != 'menu'
    ::Element.find('.dropdown-content').remove_class('show')
  end
end

class AppMenu < HyperComponent

  before_mount do
    @menu = ''
    change_menu
  end

  render(DIV) do

    Mui.AppBar(position: :fixed, className: 'other-background') do
      Mui.Toolbar() do
        if @menu == 'true'
          Mui.IconButton( id:'menu', 'aria-owns': 'simple-menu', 'aria-haspopup': true) do
            Sem.Icon(id:'menu', name: 'diamond', size: :small, color: :pink)
            DIV(id:'menu', class: "dropdown-content") do
              Mui.MenuList(id:'menu') do
                Mui.MenuItem(id:'menu', class: 'white-text') {'Docs'}.on(:click) { docs_link }
                Mui.MenuItem(id:'menu', class: 'white-text') {'Github'}.on(:click) { repo_link }
                Mui.MenuItem(id:'menu', class: 'white-text') {'Chat'}.on(:click) { chat_link }
              end
            end
          end.on(:click) do|evt|
            ::Element.find('.dropdown-content').add_class('show')
          end
        else
          Mui.Button(variant: :contained, color: :default) do
            Mui.Typography(){'Hyperstack'}
          end.on(:click) { AppStore.history.push "/#{AppStore.version}" }

          DIV(className: 'right') do
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined, className: 'space-right', style:{"color": "white"}) {'Docs'}.on(:click) { docs_link }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined,className: 'space-right', style:{"color": "white"}) {'Github'}.on(:click) { repo_link }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined,className: 'space-right', style:{"color": "white"}) {'Chat'}.on(:click) { chat_link }
            end
          end
        end
      end
    end
    BR() {}
    BR() {}
  end

  def change_menu
    `function myFunction(x) {
      if (x.matches) {
        document.body.style.backgroundColor = "white";
        #{mutate @menu = 'true'}
      } else {
          document.body.style.backgroundColor = "white";
        #{mutate @menu = 'false'}
      }
      }

    var x = window.matchMedia("(max-width: 700px)")
    myFunction(x)
    x.addListener(myFunction) `
  end

  def chat_link
    `window.open('https://hyperstack.org/slack-invite', "_blank");`
  end

  def repo_link
    `window.open('https://github.com/hyperstack-org', "_blank");`
  end

  def docs_link
    AppStore.history.push "/#{AppStore.version}/docs"
  end
end
