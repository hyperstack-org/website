# class Filter < Hyperloop::Component
#   render(DIV) do
#     Sem.Input(iconPosition: 'left', placeholder: 'Find...', action: true, fluid: true,
#               defaultValue: TocFilterStore.filter) do
#       INPUT().on(:change) do |e|
#         TocFilterStore.filter = e.target.value
#       end
#     end
#     Sem.Button { "X" }.on(:click) do
#       TocFilterStore.filter = ''
#     end unless TocFilterStore.filter.empty?
#   end
# end

class Filter < Hyperloop::Component
  render(DIV) do
    Sem.Input(icon:'search', iconPosition: 'left', placeholder: 'Find...', fluid: true,
              defaultValue: TocFilterStore.filter).on(:change) do |e|
        TocFilterStore.filter = e.target.value
      end
    end
    Sem.Button { "X" }.on(:click) do
      TocFilterStore.filter = ''
    end # unless TocFilterStore.filter.empty?
end
