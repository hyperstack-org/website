class AppFooter < Hyperloop::Router::Component

  render do
    
    DIV(class: 'ui vertical inverted black footer segment') do
        DIV(class: 'container') do
          DIV(class: 'ui stackable inverted divided relaxed grid') do
            DIV(class: 'eight wide column') do
              H3(class: 'ui inverted header') { 'Hyperloop' }
              P() { 'Nec minus feminae quoque calamitatum participes fuere similium. nam ex hoc quoque sexu peremptae sunt originis altae conplures' }
              FORM(action: '', method: 'post', target: '_top') do
                INPUT(type: 'hidden', name: 'cmd', value: '_s-xclick')
                INPUT(type: 'hidden', name: 'hosted_button_id', value: '7ZAF2Q8DBZAQL')
                BUTTON(type: 'submit', class: 'ui pink hyperlooppinkbutton button') { 'Hyperloop' }
              end
            end
            DIV(class: 'four wide column') do
              H5(class: 'ui pink inverted header hyperlooppink') { 'Contribute' }
              DIV(class: 'ui inverted link list') do
                A(class: 'item', href: '') { 'Translate' }
                A(class: 'item', href: '', target: '_blank') { 'Issue Tracker' }
                A(class: 'item', href: '', target: '_blank') { 'CLA' }
                A(class: 'disabled item') { 'others' }
              end
            end
            DIV(class: 'four wide column') do
              H5(class: 'ui pink inverted header hyperlooppink') { 'Hyperloop Network' }
              DIV(class: 'ui inverted link list') do
                A(class: 'item', href: '', target: '_blank') { 'Gitter' }
                A(href: '', class: 'item') { '' }
                A(href: '', class: 'item') { '' }
                A(class: 'disabled item') { '' }
              end
            end
          end
        end
      end

    
  end


end