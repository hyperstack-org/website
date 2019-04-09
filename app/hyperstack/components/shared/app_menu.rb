require 'helpers/helpers'
class AppMenu < HyperComponent

  before_mount do
    @menu = ''
    change_menu
  end

  render(DIV) do
    Mui.AppBar(position: :fixed, className: 'other-background') do
      Mui.Toolbar() do

        if @menu == 'true'
          Mui.IconButton() do
            Sem.Icon(name: 'diamond', size: :small)
          end
        else
          Mui.Button(color: :secondary ) {'Hyperstack'}.on(:click) { AppStore.history.push "/#{AppStore.version}" }

          DIV(className: 'right') do
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :contained, color: :secondary, className: 'space-right') {'Docs'}.on(:click) { AppStore.history.push "/#{AppStore.version}/docs" }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined, color: :secondary, className: 'space-right') {'Github'}.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
            end

            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined, color: :secondary, className: 'space-right') {'Chat'}.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
            end
          end
        end
      end
    end
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

    # how would I write this in Ruby?
    # def my_def(x)
    #   if x # x.matches is not defined
    #     alert 'boom'
    #   else
    #     alert 'pow'
    #   end
    # end
    # x = `window`.match_media("(max-width: 700px)")
    # my_def(x)
    # x.add_listener('my_def') # add_listener is not defined
  end

end
