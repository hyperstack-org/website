class AppFooter < Hyperloop::Component

  render(DIV) do
    Sem.Segment(inverted: true, class: 'gray-background') do
      Sem.Container(class: :block) do
        Sem.Grid(columns: 2, relaxed: false, padded: false) do
          Sem.GridColumn(width: 12) { slogan }
          Sem.GridColumn(width: 4) { links }
        end
      end
    end
  end

  def slogan
    P(class: 'project-tagline') do
      SPAN { 'Hyperstack is ' }
      SPAN(class: 'green-text') { 'open source' }
      SPAN { ' and supported by a '}
      SPAN(class: 'blue-text') { 'friendly commuinity' }
    end
    P(class: 'gray-text') { 'Reach out in Gitter and we will be happy to help get you onboarded.' }
  end

  def links
    A { 'Github' }.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
    BR()
    A { 'Gitter chat' }.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
    BR()
    A { 'License' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/LICENSE', "_blank");` }
    BR()
    A { 'Code of Conduct' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/CODE_OF_CONDUCT.md', "_blank");` }
    BR()
  end
end

# Sem.Container(textAlign: :center, class: 'block') { friendly_community }
# Sem.Container(textAlign: :center, class: 'block') { get_started }



# def friendly_community
#   Sem.Header(size: :large, class: :pink) { "Hyperstack is open source and supported by a friendly commuinity." }
#   P { 'Reach out in the Gitter chat, we will be happy to help you get onboarded!' }
# end
#
# def get_started
#   Sem.Grid(columns: 2) do
#     Sem.GridColumn do
#       Sem.Button(primary: true, basic: true, size: :huge) { "Join the chat on Gitter" }.on(:click) do
#         `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");`
#       end
#     end
#   end
# end
