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
                Mui.MenuItem(id:'menu', class: 'white-text') {'Docs'}.on(:click) { AppStore.history.push "/#{AppStore.version}/docs" }
                Mui.MenuItem(id:'menu', class: 'white-text') {'Github'}.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
                Mui.MenuItem(id:'menu', class: 'white-text') {'Chat'}.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
              end

            end
          end.on(:click) do|evt|
            ::Element.find('.dropdown-content').add_class('show')
          end
        else
          Mui.Button(variant: :contained, color: :default) do
            Mui.Typography(){'Hyperstack '}
            Sem.Icon(id:'menu', name: 'diamond', color: :grey )
          end.on(:click) { AppStore.history.push "/#{AppStore.version}" }

          DIV(className: 'right') do
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :contained, className: 'space-right') {'Docs'}.on(:click) { AppStore.history.push "/#{AppStore.version}/docs" }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :contained,className: 'space-right') {'Github'}.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :contained,className: 'space-right') {'Chat'}.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
            end
          end
        end
      end
    end

    BR(){}
    BR(){}
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

end
