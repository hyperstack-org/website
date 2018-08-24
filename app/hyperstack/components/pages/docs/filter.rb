class Filter < Hyperstack::Component
  render(DIV) do
    Sem.Grid() do
      Sem.GridRow do
        Sem.GridColumn(width: width) do
          Sem.Input(icon:'search', iconPosition: 'left', placeholder: 'Find...', fluid: true,
                    value: TocFilterStore.filter).on(:change) do |e|
              TocFilterStore.filter = e.target.value
          end
        end
        Sem.GridColumn(width: 2, textAlign: :center) do
          Sem.Button(circular: true, icon: true) { Sem.Icon(name: :close) }.on(:click) do
            TocFilterStore.filter = ''
          end
        end unless TocFilterStore.filter.empty?
      end
    end
  end

  def width
    TocFilterStore.filter.empty? ? 16 : 11
  end
end
