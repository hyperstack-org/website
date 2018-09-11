class HomePage < Hyperloop::Router::Component
  render do
    DIV() do
      Sem.Container(fluid: true) do
        # AppMenu(section: 'home')

        MastHead()

        Sem.Container(textAlign: :center) { introduction }
        Sem.Divider(hidden: true)

        Sem.Container() do
          simple_components
          stylish_components
          stateful_components
          javascript_components
        end

        Sem.Container(textAlign: :center) { isomorphic }
        Sem.Divider(hidden: true)

        Sem.Container do
          three_columns_of_text
          friendly_community
        end

        SearchResultModal(history: history)
        AppFooter()
      end
    end
  end

  def introduction
    Sem.Header(size: :huge) do
      DIV {"Hyperstack's user-interface is written in Ruby, compiled by Opal" }
      DIV { 'and powered by React' }
    end
  end

  def simple_components
    content = DIV do
      Sem.Header(as: :h2) { "Simple Components" }
      P { "As with React, a Hyperstack user-interface is composed of Components which mix conditional logic and HTML elements." }
      # P { "As with React, there are no templates in Hyperstack. Unlike React, where you code in JSX and JavaScript, all your code in Ruby!" }
      P { "Under the covers, we use Opal to compile your Ruby code into JavaScript then hand it to React to mount as a regular JavaScript React Component." }
    end.as_node

    LiveCodeSegment(content: content, code: HELLO_WORLD_EXAMPLE)
  end

  def stylish_components
    content = DIV do
      Sem.Header(as: :h2) { "Stylish Components" }
      P { "Conditional logic, HTML elements, state and style all intermingle in a Hyperstack Component." }
      P { "You specify the CSS class on any HTML element." }
      P { "We think the Ruby DSL is a lot nicer to work with than ERB or JSX!" }
      P { "You will notice that the HTML elements (BUTTON, H1, etc.) are in CAPS. We know this is bending the Ruby rules slightly, but we think it reads better this way." }
    end.as_node

    LiveCodeSegment(content: content, code: STYLISH_COMPONENT  )
  end

  def stateful_components
    content = DIV do
      Sem.Header(as: :h2) { "Stateful Components" }
      P { "In Hyperstack you write code in a declarative way with Components that manage their State." }
      P { "As State changes, React works out how to render the user interface without you having to worry about the DOM - the user interface re-renders itself when State changes." }
      P { "To reference State we use state.foo and to mutate (change it) we use mutate.foo(true)" }
      P { "Components manage their State. To share State between Components we use Stores, which you can read about in the DSL docs." }
    end.as_node

    LiveCodeSegment(content: content, code: STATE_EXAMPLE)
  end

  def javascript_components
    content = DIV do
      Sem.Header(as: :h2) { "JavaScript Components" }
      P { "Hyperstack gives you full access to all JavaScript libraries and components from directly within your Ruby code." }
      # P { "Everything you can do in JavaScript is simple to do in Ruby, this includes passing parameters between Ruby and JavaScript and even passing Ruby methods as JavaScript callbacks!" }
      P { "Notice how we used DatePicker (which is a React.JS component) as if it were a Ruby class and also see how we used `backticks` to jump into native Javascript." }
    end.as_node

    LiveCodeSegment(content: content, code: JAVASCRIPT_COMPONENTS)
  end

  def isomorphic
    Sem.Header(size: :huge) do
      DIV() { 'Real magic happens when you combine this with Isomorphic models' }
    end
  end

  def stack_overview
    DIV(class: 'ui page grid') do
      DIV(class: 'fifteen wide column centered') do
        BR()
        Sem.Header(size: :huge, textAlign: :center) { "Full-stack modern Web tooling with everything you need to build stunning, interactive single-page Web applications quickly in a language you love - Ruby." }
        BR()
      end
    end
    Sem.Grid(celled: true) do
      Sem.GridRow(columns: 1, class: 'no-padding') do
        Sem.GridColumn() do
           Sem.Image(src: '/images/hyperstack_react.png', size: :huge, centered: true)
        end
      end
      Sem.GridRow(columns: 1, class: 'no-padding') do
        Sem.GridColumn() do
           Sem.Image(src: '/images/webpack_opal.png', size: :medium, centered: true)
         end
      end
      # hs1_stacks if AppStore.version == 'hs1'
      hs2_stacks # if AppStore.version == 'hs2'
    end

    DIV(class: 'ui page grid') do
      DIV(class: 'fifteen wide column centered') do
        Sem.Header(size: :huge, textAlign: :center) do
          DIV {"Hyperstack integrates with your favourite back-end to synchronize data between any ActiveRecord based ORM and the front-end."}
          BR()
          DIV {"We even include a fast, hot-loading build environment for pure programmer joy!"}
        end
        BR()
        BR()
      end
    end
  end

  # def hs1_stacks
  #   Sem.GridRow(columns: 3, class: 'no-padding') do
  #     Sem.GridColumn() { }
  #     Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
  #        Sem.Image(src: '/images/rails.png', size: :medium, centered: true)
  #      end
  #     Sem.GridColumn() { }
  #   end
  # end

  def hs2_stacks
    Sem.GridRow(columns: 6, class: 'no-padding') do
      Sem.GridColumn() { }
      Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
         Sem.Image(src: '/images/rails.png', size: :medium, centered: true)
       end
      Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
         Sem.Image(src: '/images/roda.png', size: :medium, centered: true, disabled: true)
         DIV { 'Coming soon' }
       end
       Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
          Sem.Image(src: '/images/amber.png', size: :medium, centered: true, disabled: true)
          DIV { 'Coming later' }
        end
        Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
           Sem.Image(src: '/images/lucky.png', size: :medium, centered: true, disabled: true)
           DIV { 'Coming later' }
         end
      Sem.GridColumn() { }
    end
  end

  def three_columns_of_text
    DIV(class: 'feature alternate ui vertical stripe segment') do
      DIV(class: 'ui three column equal height center aligned divided relaxed stackable page grid') do
        DIV(class: 'column') do
          H2(class: 'ui icon header') do
            IMG(class: 'ui icon image', src: 'images/icons/code-signs-in-rounded-square-interface-symbol.png')
            'Fast'
          end
          P() { 'Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development, so you can focus on innovation and delivering end-user value.' }
        end

        DIV(class: 'column') do
          H2(class: 'ui icon header') do
            IMG(class: 'ui icon image', src: 'images/icons/code.png')
            'Isomorphic'
          end
          P() { 'One language. One model. One set of tests. The same business logic and domain Models are running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code. Hyperstack lets you build beautiful interactive user interfaces in Ruby.' }
        end

        DIV(class: 'column') do
          H2(class: 'ui icon header') do
            IMG(class: 'ui icon image', src: 'images/icons/molecule.png')
            'Thorough'
          end
          P() { 'Everything has a place in our architecture. Components deliver interactive user experiences, Operations encapsulate business logic, Models magically synchronize data between clients and servers, Policies govern authorization and Stores hold local state.' }
        end
      end
    end
  end

  def friendly_community
    DIV(class: 'ui page grid') do
      DIV(class: 'fifteen wide column centered') do
        BR()
        Sem.Header(size: :huge, textAlign: :center) do
          DIV() {' Hyperstack is open-source and supported by a' }
          DIV() { 'friendly commuinity.' }
          BR()
          DIV() { 'Reach out in the Gitter chat, we will be happy to help you get onboarded.' }
        end
        BR()
        BR()
      end
    end
  end

end
