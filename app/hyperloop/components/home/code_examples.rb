HELLO_WORLD_EXAMPLE = %q(
class HelloWorld < Hyperloop::Component
  # try changing 'world' to your own name
  # and see what happens...

  render(DIV) do
    # a Component must render just one HTML element
    # Components are composed of Components
    Greeter(greet: 'world')
  end
end

class Greeter < Hyperloop::Component
  # paramaters are passed downward
  param :greet

  render(DIV) do
    # and accessed like this...
    H1 { "Hello #{params.greet}" }
  end
end
)


STYLISH_COMPONENT = %q(
class HtmlDslExamples < Hyperloop::Component
  # Notice that HTML elements are in CAPS
  # You can specify the CSS class on any HTML element

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

  state :show # if show is true then show the stuff
  state :input_value # changes to state cause a re-render

  render(DIV) do
    # the button method returns an HTML element
    # .on(:click) is an event handeler
    button.on(:click) { mutate.show !state.show }
    DIV do
      input
      output
    end if state.show
  end

  def button
    BUTTON(class: 'ui primary button') do
      state.show ? "Hide" : "Show"
    end
  end

  def input
    DIV(class: 'ui input block') do
      INPUT(type: :text).on(:change) do |evt|
        # we are updating the value per keypress
        mutate.input_value evt.target.value
      end
    end
  end

  def output
    # this will re-render whenever input_value changes
	P { "#{state.input_value}" }
  end
end
)

JAVASCRIPT_COMPONENTS = %q(
class SelectDate < Hyperloop::Component

  before_mount do
    # before_mount will run only once
    # moment is a JS function so we use ``
    mutate.date `moment()`
  end

  render(DIV) do
    # DatePicker is a JS Component imported with Webpack
    # Notice the lambda to pass a Ruby method as a callback
    DatePicker(selected: state.date,
               todayButton: "Today",
               onChange: ->(date) { mutate.date date }
    )

    # see how we use `` and #{} to b ridger JS and Ruby
    H3 { `moment(#{state.date}).format('LL')` }
    #  or if you prefer..
    # H3 { Native(`moment`).call(state.date).format('LL') }

    # In this example, Sem is an imported JS library
    # type 'Sem.' on your JavaScript console...
    button = Sem.Button { 'Open Modal' }.as_node
    Sem.Modal(trigger: button.to_n) do
      Sem.ModalHeader { 'heading' }
      Sem.ModalContent { 'content' }
    end
  end
end
)
