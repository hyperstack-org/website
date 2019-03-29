class AppFooter < HyperComponent

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
    P(class: 'project-tagline-footer') do
      SPAN { 'Hyperstack is ' }
      SPAN(class: 'green-text') { 'open source' }
      SPAN { ' and supported by a '}
      SPAN(class: 'blue-text') { 'friendly community' }
    end
    P(class: 'gray-text') { 'Reach out in Gitter and we will be happy to help get you onboarded.' }
  end

  def links
    A { 'Github' }.on(:click) { `window.open('https://github.com/hyperstack-org', "_blank");` }
    BR()
    A { 'Gitter chat' }.on(:click) { `window.open('https://gitter.im/ruby-hyperloop/chat', "_blank");` }
    BR()
    A { 'Stack Overflow questions' }.on(:click) { `window.open('https://stackoverflow.com/questions/ask?tags=hyperstack+ruby-on-rails+reactjs+ruby+isomorphic', "_blank");` }
    BR()
    A { 'Docs' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/tree/edge/docs', "_blank");` }
    BR()
    A { 'License' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/LICENSE', "_blank");` }
    BR()
    A { 'Code of Conduct' }.on(:click) { `window.open('https://github.com/hyperstack-org/hyperstack/blob/edge/CODE_OF_CONDUCT.md', "_blank");` }
  end
end
