class MastHead < Hyperloop::Component
  render(DIV) do
    DIV(class: 'ui inverted vertical masthead aligned segment') do
      Sem.Grid(columns: 2) do
        Sem.GridColumn(width: 4) { DIV(class: 'hyperlooplogo') }
        Sem.GridColumn(width: 12) do
          Sem.Header(as: :h1, inverted: true) { "Hyperstack" }
           Sem.Header(as: :h2, inverted: true) { "Build spectacular, full-stack, interactive web applications in Ruby" }
         end
      end
    end
  end
end




# class MastHead < Hyperloop::Component
#   render(DIV) do
#     DIV(class: 'masthead segment stopped') do
#       DIV(class: 'ui page grid') do
#         DIV(class: 'fourteen wide column centered') do
#           DIV(class: 'introduction') do
#             H1(class: 'ui inverted header') do
#               SPAN(class: 'library') { 'Build spectacular Web applications in Ruby' }
#             end
#             DIV(class: 'ui hidden divider')
#             H2(class: 'ui header') do
#               Sem.Header(class: 'inverted') do
#                 DIV { "Think JavaScript is your only option for the front-end?" }
#                 DIV { "Think again." }
#               end
#             end
#             DIV(class: 'ui hidden divider')
#             # Link("/#{AppStore.version}/docs", class: 'ui big basic inverted pink view-ui button getstartedbutton') do
#             #   I(class: 'sidebar icon')
#             #   "\n          Get Started\n        "
#             # end
#           end
#         end
#       end
#     end
#   end
# end
