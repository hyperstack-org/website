class MastHead < Hyperloop::Component
  render(DIV) do
    Sem.Segment(inverted: true, class: 'gray-background') do
      DIV(class: 'block') do
        Sem.Grid(columns: 4, padded: true) do
          Sem.GridColumn(width: 2)
          Sem.GridColumn(width: 3) { Sem.Image(src: 'images/logo/hyperloop-logo-large-pink.png', size: :small, centered: true) }
          Sem.GridColumn(width: 9) do
            P(class: 'project-header') { "Hyperstack" }
            P(class: 'project-tagline') { "Full-stack, interactive, web applications in Ruby" }
           end
          Sem.GridColumn(width: 2)
        end
      end
    end
  end
end
