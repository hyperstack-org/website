HELLO_WORLD_EXAMPLE = %q(
class HelloWorld < Hyperloop::Component
  render(DIV) do
    Greater(greet: 'world')
  end
end

class Greater < Hyperloop::Component
  param :greet

  render(DIV) do
    H1 { "Hello #{params.greet}" }
  end
end
)


STYLISH_COMPONENT = %q(
class StylishComponent < Hyperloop::Component
  render(DIV) do
    DIV(class: 'ui info message') do
      H3 { "Well done!" }
    end

    TABLE(class: 'ui celled table') do
      THEAD do
        TR do
          TH { "One" }
          TH { "Two" }
          TH { "Three" }
        end
      end
      TBODY do
        TR do
          TD { "A" }
          TD(class: 'negative') { "B" }
          TD { "C" }
        end
      end
    end
  end
end
)


STATE_EXAMPLE = %q(
class StateExample < Hyperloop::Component
  render(DIV) do
    show_hide_button
    DIV do
      show_example
    end if state.show
  end

  def show_hide_button
    BUTTON(class: 'ui primary button') do
      state.show ? "Hide" : "Show"
    end.on(:click) { mutate.show !state.show }
  end

  def show_example
    BR()
    DIV(class: 'ui input') do
      INPUT(type: :text).on(:change) do |e|
        mutate.field_value e.target.value
      end
    end
    5.times do
      H3 { "#{state.field_value}" }
    end
  end
end
)


JAVASCRIPT_COMPONENTS = %q(
class SelectDate < Hyperloop::Component
  render(DIV) do
    DatePicker(selected: `moment()`,
               todayButton: "Today",
               onChange: lambda { |date| mutate.date date }
    )

    selected_date = `moment(#{state.date}).format('LL')`
    state.date ? ( H3 { selected_date } ) : (H3 { "Select a date" })

    time_now = `moment().format('LLLL')`
    P { "Time now is #{time_now}" }
  end
end
)
