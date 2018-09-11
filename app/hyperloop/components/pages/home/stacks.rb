class Stacks < Hyperloop::Component
  render(DIV) do
    Sem.Grid(columns: 2, relaxed: false, padded: false) do
      Sem.GridColumn(width: 4) { content }
      Sem.GridColumn(width: 12) { stack_diagram }
    end
  end

  def stack_diagram
    Sem.Grid(celled: true) do
      Sem.GridRow(columns: 1, class: 'no-padding') do
        Sem.GridColumn() do
           Sem.Image(src: '/images/hyperstack_react.png', size: :large, centered: true)
        end
      end
      Sem.GridRow(columns: 1, class: 'no-padding') do
        Sem.GridColumn() do
           Sem.Image(src: '/images/webpack_opal.png', size: :small, centered: true)
         end
      end
      Sem.GridRow(columns: 1, class: 'no-padding') do
        Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
           Sem.Image(src: '/images/rails.png', size: :small, centered: true)
         end
      end
    end
  end

  def content
    Sem.Header(as: :h2) { "Modern tooling" }
    P { "Hyperstack integrates with your favourite back-end (*) to synchronize data between any ActiveRecord based ORM and the front-end." }
    P { "We even include a fast, hot-loading build environment for pure programmer joy!" }
    P { "* Rails today, but watch this space and see the Roadmap." }
  end
end


# Sem.Grid do
#   Sem.GridRow(columns: 6, class: 'no-padding') do
#     Sem.GridColumn() { }
#     Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
#        Sem.Image(src: '/images/rails.png', size: :medium, centered: true)
#      end
#     Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
#        Sem.Image(src: '/images/roda.png', size: :medium, centered: true, disabled: true)
#        DIV { 'Coming soon' }
#      end
#      Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
#         Sem.Image(src: '/images/amber.png', size: :medium, centered: true, disabled: true)
#         DIV { 'Coming later' }
#       end
#       Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
#          Sem.Image(src: '/images/lucky.png', size: :medium, centered: true, disabled: true)
#          DIV { 'Coming later' }
#        end
#     Sem.GridColumn() { }
#   end
# end



# DIV(class: 'ui page grid') do
#   DIV(class: 'fifteen wide column centered') do
#     BR()
#     Sem.Header(size: :huge, textAlign: :center) { "Full-stack modern Web tooling with everything you need to build stunning, interactive single-page Web applications quickly in a language you love - Ruby." }
#     BR()
#   end
# end


# DIV(class: 'ui page grid') do
#   DIV(class: 'fifteen wide column centered') do
#     Sem.Header(size: :huge, textAlign: :center) do
#       DIV {"Hyperstack integrates with your favourite back-end to synchronize data between any ActiveRecord based ORM and the front-end."}
#       BR()
#       DIV {"We even include a fast, hot-loading build environment for pure programmer joy!"}
#     end
#     BR()
#     BR()
#   end
# end
