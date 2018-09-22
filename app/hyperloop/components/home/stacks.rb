class Stacks < Hyperloop::Router::Component
  param :history

  render(DIV, class: 'block') do
    Sem.Grid(columns: 2, relaxed: false, padded: false) do
      Sem.GridColumn(width: 4) { content }
      Sem.GridColumn(width: 12) { stack_diagram }
    end
  end

  def stack_diagram
    Sem.Grid(celled: false, columns: 1) do
      Sem.GridRow { }
      Sem.GridRow do
        Sem.GridColumn do
           Sem.Image(src: '/images/logos.png', size: :large, centered: false)
        end
      end
      Sem.GridRow do
        Sem.GridColumn do
          Sem.Button(primary: true, size: :large, basic: true) { "Create a 'Hello World' Rails app in under 5 minutes!" }.on(:click) do
            params.history.push '/edge/docs/installation/installation'
          end
        end
      end
    end
  end

  def content
    Sem.Header(as: :h2, class: 'pink-text') { "Modern tooling" }
    P { "Hyperstack integrates with your favourite back-end (*) to synchronize data between any ActiveRecord based ORM and the front-end." }
    P { "We even include a fast, hot-loading build environment for pure programmer joy!" }
    P { "* Rails today, but watch this space and see the Roadmap." }
  end
end
