class HomePage < Hyperstack::Router::Component
  render do
    DIV(id: 'example', class: 'index') do
      DIV(class: 'page_wrap full height') do
        AppMenu(section: 'home')
        mast_head
        stack_overview
        three_columns_of_text
        SearchResultModal(history: history)
      end
      AppFooter()
    end
  end

  def mast_head
    DIV(class: 'masthead segment stopped') do
      DIV(class: 'ui page grid') do
        DIV(class: 'fourteen wide column centered') do
          DIV(class: 'introduction') do
            H1(class: 'ui inverted header') do
              SPAN(class: 'library') { 'Build spectactular Web applications in Ruby' }
            end

            DIV(class: 'ui hidden divider')
            H2(class: 'ui header') do
              Sem.Header(class: 'inverted') do
                DIV { "Think JavaScript is your only option for the front-end?" }
                DIV { "Think again." }
              end
            end

            DIV(class: 'ui hidden divider')
            Link("/#{AppStore.version}/docs", class: 'ui big basic inverted pink view-ui button getstartedbutton') do
              I(class: 'sidebar icon')
              "\n          Get Started\n        "
            end

          end
        end
      end
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
      hs1_stacks if AppStore.version == 'hs1'
      hs2_stacks if AppStore.version == 'hs2'
    end

    DIV(class: 'ui page grid') do
      DIV(class: 'fifteen wide column centered') do
        Sem.Header(size: :huge, textAlign: :center) do
          DIV {"Hyperstack integrates with your favourage back-end to sunchronize data between any ActiveRecord based ORM and the front-end."}
          BR()
          DIV {"We even include a fast, hot-loading build environment for pure programmer joy!"}
        end
        BR()
        BR()
      end
    end
  end

  def hs1_stacks
    Sem.GridRow(columns: 3, class: 'no-padding') do
      Sem.GridColumn() { }
      Sem.GridColumn(verticalAlign: :middle, textAlign: :center) do
         Sem.Image(src: '/images/rails.png', size: :medium, centered: true)
       end
      Sem.GridColumn() { }
    end
  end

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
          P() { 'One language. One model. One set of tests. The same business logic and domain models running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code. Hyperstack lets you build beautiful interactive user interfaces in Ruby.' }
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
