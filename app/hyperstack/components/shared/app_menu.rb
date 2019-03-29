require 'helpers/helpers'

class AppMenu < HyperComponent
  render(DIV) do
      Mui.AppBar(position: :fixed, className: 'other-background') do
        Mui.Toolbar() do
          Mui.Button(color: :secondary ) {'Hyperstack'}.on(:click) { AppStore.history.push "/#{AppStore.version}" }

          DIV(className: 'right') do
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :contained, color: :secondary, className: 'space-right') {'Docs'}.on(:click) { AppStore.history.push "/#{AppStore.version}/docs" }
            end
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined, color: :secondary, className: 'space-right') {'Github'}.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
            end
            # SPAN(class: 'space-right' ) do
            #   Mui.Button(variant: :outlined, color: :secondary, className: 'space-right') {'Blog'}.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
            # end
            SPAN(class: 'space-right' ) do
              Mui.Button(variant: :outlined, color: :secondary, className: 'space-right') {'Chat'}.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
            end

            IFRAME(class: 'github',
             src: 'https://ghbtns.com/github-btn.html?user=hyperstack-org&repo=hyperstack&type=watch&count=true',
             frameBorder: '0', scrolling: '0', width: '100', height: '20')
          end
        end
      end
  end
end
