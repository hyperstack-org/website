class AppFooter < Hyperloop::Router::Component

  render do

    DIV(class: 'ui vertical inverted black footer segment') do
        DIV(class: 'container') do
          BR()
          BR()
        #   DIV(class: 'ui stackable inverted divided relaxed grid') do
        #     DIV(class: 'eight wide column') do
        #       H3(class: 'ui inverted header') { '' }
        #       P() { '' }
        #       FORM(action: '', method: 'post', target: '_top') do
        #         INPUT(type: 'hidden', name: 'cmd', value: '_s-xclick')
        #         INPUT(type: 'hidden', name: 'hosted_button_id', value: '7ZAF2Q8DBZAQL')
        #         BUTTON(type: 'submit', class: 'ui pink hyperlooppinkbutton button') { 'Hyperstack' }
        #       end
        #     end
        #     DIV(class: 'four wide column') do
        #       #H3(class: 'ui pink inverted header hyperlooppink') { 'Contribute' }
        #       DIV(class: 'ui inverted link list') do
        #         A(class: 'item', href: 'https://github.com/hyperstack-org') { 'Github' }
        #         A(class: 'item', href: 'https://gitter.im/ruby-hyperloop/chat', target: '_blank') { 'Chat' }
        #         # A(class: 'item', href: '', target: '_blank') { 'CLA' }
        #         # A(class: 'disabled item') { 'others' }
        #       end
        #     end
        #     # DIV(class: 'four wide column') do
        #     #   H5(class: 'ui pink inverted header hyperlooppink') { 'Hyperloop Network' }
        #     #   DIV(class: 'ui inverted link list') do
        #     #     A(class: 'item', href: '', target: '_blank') { 'Gitter' }
        #     #     A(href: '', class: 'item') { '' }
        #     #     A(href: '', class: 'item') { '' }
        #     #     A(class: 'disabled item') { '' }
        #     #   end
        #     # end
        #   end
        end
      end


  end


end
