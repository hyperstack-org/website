HELLO_WORLD_EXAMPLE = %q(
class HelloWorld < HyperComponent
  render(DIV) do
    # try changing 'world' to your own name
    H1 { 'Hello world' }
    P(class: 'green-text') { "Let's gets started!" }
  end
end
)

STYLISH_COMPONENT = %q(
class HtmlDslExample < HyperComponent
  # Notice that HTML elements are in CAPS
  # You can specify the CSS class on any HTML element

  render(DIV) do
    box
    table
    list
  end

  def box
    DIV(class: 'ui info message') do
      H3 { 'Blue Box' }
    end
  end

  def table
    TABLE(class: 'ui celled table') do
      THEAD do
        TR do
          TH { 'One' }
          TH { 'Two' }
          TH { 'Three' }
        end
      end
      TBODY do
        TR do
          TD { 'A' }
          TD(class: 'negative') { 'B' }
          TD { 'C' }
        end
      end
    end
  end

  def list
    UL do
      10.times { |n| LI { "Number #{n}" }}
    end
  end
end
)


STATE_EXAMPLE = %q(
class UsingState < HyperComponent

  # state :show # if show is true then show the stuff
  # state :input_value # changes to state cause a re-render

  render(DIV) do
    # the button method returns an HTML element
    # .on(:click) is an event handeler
    button.on(:click) { mutate @show = !@show }
    DIV do
      input
      output
      easter_egg
    end if @show
  end

  def button
    BUTTON(class: 'ui primary button') do
      @show ? 'Hide' : 'Show'
    end
  end

  def input
    DIV(class: 'ui input fluid block') do
      INPUT(type: :text).on(:change) do |evt|
        # we are updating the value per keypress
        mutate @input_value = evt.target.value
      end
    end
  end

  def output
    # this will re-render whenever input_value changes
	P { "#{@input_value}" }
  end

  def easter_egg
    H2 {'you found it!'} if @input_value == 'egg'
  end
end
)

JAVASCRIPT_COMPONENTS = %q(
class JSExamples < HyperComponent
  render(DIV) do
    # Notice how Components are composed of Components
    MyModal()
    Sem.Divider(hidden: true) # Sem is a JS library
    SelectDate()
  end
end

class MyModal < HyperComponent
  render(DIV) do
    # Sem is Semantic UI React (imported)
    # type 'Sem.' on your JavaScript console...
    button = Sem.Button { 'Open Modal' }.as_node
    Sem.Modal(trigger: button.to_n) do
      Sem.ModalHeader { 'Heading' }
      Sem.ModalContent { 'Content' }
    end
  end
end

class SelectDate < HyperComponent
  before_mount do
    # before_mount will run only once
    # moment is a JS function so we use ``
    mutate @date = `moment()`
  end

  render(DIV) do
    # DatePicker is a JS Component imported with Webpack
    # Notice the lambda to pass a Ruby method as a callback
    DatePicker(selected: @date,
               todayButton: "Today",
               onChange: ->(date) { mutate @date = date }
    )
    # see how we use `` and #{} to bridge JS and Ruby
    H3 { `moment(#{@date}).format('LL')` }
    #  or if you prefer..
    # H3 { Native(`moment`).call(@date).format('LL') }
  end
end
)

SERVERLESS = %q(
class FaaS < HyperComponent
  render(DIV) do
    BUTTON { 'faastruby.io' }.on(:click) do
      faast_ruby
    end
    DIV(class: :block) do
      P { @hello['function_response'].to_s }
      P { "executed in #{@hello['execution_time']} ms" }
    end if @hello
  end

  def faast_ruby
    HTTP.get('https://api.faastruby.io/paulo/hello-world',
      data: {time: true}
    ) do |response|
      # this code executes when the promise resolves
      mutate @hello = response.json if response.ok?
    end
  end
end
)
