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
class SomeExamples < Hyperloop::Component
  render(DIV) do
    DIV(class: 'ui info message') do
      H3 { "Information!" }
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

    UL do
      10.times { |n| LI { "Number #{n}" }}
    end
  end
end
)


STATE_EXAMPLE = %q(
class UsingState < Hyperloop::Component
  render(DIV) do
    button.on(:click) { mutate.show !state.show }
    DIV { example } if state.show
  end

  def button
    BUTTON(class: 'ui primary button') do
      state.show ? "Hide" : "Show"
    end
  end

  def example
    BR()
    DIV(class: 'ui input') do
      INPUT(type: :text).on(:change) do |e|
        mutate.value e.target.value
      end
    end

    H3 { "#{state.value}" }
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

    H3 { `moment(#{state.date}).format('LL')` }
  end
end
)
