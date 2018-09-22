class MastHead < Hyperloop::Component
  render(DIV) do
    Sem.Segment(inverted: true, class: 'gray-background') do
      DIV(class: 'block') do
        Sem.Grid(columns: 4, padded: true) do
          Sem.GridColumn(width: 2)
          Sem.GridColumn(width: 3) { DIV(class: 'hyperlooplogo') }
          Sem.GridColumn(width: 9) do
            P(class: 'project-header') { "Hyperstack" }
            P(class: 'project-tagline') { tag_line }
           end
          Sem.GridColumn(width: 2)
        end
      end
    end
  end

  def tag_line
    SPAN { 'Think ' }
    SPAN(class: 'red-text') { 'JavaScript' }
    SPAN { ' is your only option for the front-end? ' }
    SPAN(class: 'yellow-text') {'Think again. ' }
    SPAN { 'Hyperstack is a ' }
    SPAN(class: 'pink-text') { STRONG { 'Ruby'  } }
    SPAN { ' DSL, compiled by ' }
    SPAN(class: 'green-text') { 'Opal' }
    SPAN {', bundled by ' }
    SPAN(class: 'purple-text') {'Webpack' }
    SPAN {', powered by ' }
    SPAN(class: 'blue-text') { 'React.' }
  end

end
