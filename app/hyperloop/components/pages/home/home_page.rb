class HomePage < Hyperloop::Router::Component
  render do
    DIV() do
      Sem.Container(fluid: true) do
        # AppMenu(section: 'home')

        MastHead()

        Sem.Divider(hidden: true)
        Sem.Container(textAlign: :center, class: 'block') { think_again }
        Sem.Container(textAlign: :center, class: 'block') { three_columns_of_text }
        Sem.Divider()

        Sem.Container(textAlign: :center, class: 'block') { introduction }

        Sem.Container() do
          simple_components
          html_dsl
          stateful_components
          javascript_in_ruby
          Stacks()
        end

        # Sem.Container(textAlign: :center) { isomorphic }

        Sem.Container(textAlign: :center, class: 'block') { friendly_community }
        Sem.Container(textAlign: :center, class: 'block') { get_started }

        AppFooter()
        SearchResultModal(history: history)
      end
    end
  end

  def think_again
    Sem.Header(size: :huge) do
      DIV {"Think JavaScript is the only option for the front end?" }
      DIV { 'Think again.' }
    end
  end


  def introduction
    Sem.Header(size: :huge) do
      DIV {"Ruby code, compiled by Opal, bundled by Webpack, powered by React." }
    end
  end

  def simple_components
    content = DIV do
      Sem.Header(as: :h2) { "Simple Components" }
      P { "As with React, a Hyperstack user-interface is composed of Components which mix conditional logic and HTML elements." }
      P { "Under the covers, we use Opal to compile your Ruby code into JavaScript then hand it to React to mount as a regular JavaScript React Component." }
    end.as_node

    LiveCodeSegment(content: content, code: HELLO_WORLD_EXAMPLE)
  end

  def html_dsl
    content = DIV do
      Sem.Header(as: :h2) { "HTML DSL" }
      P { "Conditional logic, HTML elements, state and style all intermingle in a Hyperstack Component." }
      P { "Notice that the HTML elements (BUTTON, DIV, etc.) are in CAPS. We know this is bending the Ruby rules slightly, but we think it reads better this way." }
      P { "You can specify the CSS class on any HTML element." }
      P { "We think the Ruby DSL is a lot nicer to work with than ERB or JSX!" }
    end.as_node

    LiveCodeSegment(content: content, code: STYLISH_COMPONENT  )
  end

  def stateful_components
    content = DIV do
      Sem.Header(as: :h2) { "Stateful Components" }
      P { "In Hyperstack you write code in a declarative way with Components that manage their own State." }
      P { "As State changes, React works out how to render the user interface without you having to worry about the DOM." }
      P { "To reference State we use state.foo and to mutate (change it) we use mutate.foo(true)" }
      P { "State is shared between Components via a Store, which you can read about in the DSL docs." }
    end.as_node

    LiveCodeSegment(content: content, code: STATE_EXAMPLE)
  end

  def javascript_in_ruby
    content = DIV do
      Sem.Header(as: :h2) { "JavaScript in Ruby" }
      P { "Hyperstack gives you full access to all JavaScript libraries and components from directly within your Ruby code." }
      # P { "Everything you can do in JavaScript is simple to do in Ruby, this includes passing parameters between Ruby and JavaScript and even passing Ruby methods as JavaScript callbacks!" }
      P { "Notice how we used DatePicker (which is a React.JS component) as if it were a Ruby class and also see how we used `backticks` to jump into native Javascript." }
    end.as_node

    LiveCodeSegment(content: content, code: JAVASCRIPT_COMPONENTS)
  end

  def isomorphic
    Sem.Header(size: :huge) do
      DIV { 'Real magic happens when you combine this with Isomorphic models' }
    end
  end

  def three_columns_of_text
    Sem.Grid(columns: 3, textAlign: :center) do

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          IMG(class: 'ui icon image', src: 'images/icons/code.png')
          'Isomorphic'
        end
        P do
          STRONG { 'One language. One model. One set of tests.' }
          SPAN { 'The same business logic and domain Models are running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code.' }
        end
      end

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          IMG(class: 'ui icon image', src: 'images/icons/code-signs-in-rounded-square-interface-symbol.png')
          'Fast'
        end
        P { 'Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development.' }
      end

      Sem.GridColumn do
        H2(class: 'ui icon header') do
          IMG(class: 'ui icon image', src: 'images/icons/molecule.png')
          'Thorough'
        end
        P { 'Components deliver interactive user experiences, Operations encapsulate business logic, Models magically synchronize data between clients and servers, Policies govern authorization and Stores hold local state.' }
      end
    end
  end

  def friendly_community
    Sem.Header(size: :huge) do
      DIV {"Hyperstack is open-source and supported by a friendly commuinity" }
      DIV { 'Reach out in the Gitter chat, we will be happy to help you get onboarded' }
    end
  end

  def get_started
    Sem.Button(primary: true, size: :huge) { "Get started in under 5 minutes!" }.on(:click) do
      history.push '/edge/docs/installation/installation'
    end
  end

end
