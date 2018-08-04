class HomePage < Hyperloop::Router::Component

  before_mount do
    SidebarStore.hide
  end

  after_mount do
    Element['.bm-overlay'].on(:click) {
      SidebarStore.hide
    }
  end

  render do
    DIV(id: 'example', class: 'index') do
      SidebarMenu()
      DIV(class: 'page-wrap') do
        main_content
      end
    end
  end

  def main_content
      DIV(class: 'full height') do
        AppMenu(section: 'home')
        DIV(class: 'masthead segment stopped') do
          DIV(class: 'ui page grid') do
            DIV(class: 'column') do
              DIV(class: 'introduction') do
                H1(class: 'ui inverted header') do
                  SPAN(class: 'library') { 'Build spectactular web applications in Ruby' }
                end

                # DIV(class: 'ui hidden divider')
                # H2(class: 'ui inverted header') do
                #   SPAN(class: 'library') { 'Single-page apps without the pain of JavaScript' }
                # end

                DIV(class: 'ui hidden divider')
                Link('/start', class: 'ui big basic inverted pink view-ui button getstartedbutton') do
                  I(class: 'sidebar icon')
                  "\n          Get Started\n        "
                end

              end
            end
          end
        end

        Sem.Image(src: '/dist/images/overview.png')

        DIV(class: 'feature alternate ui vertical stripe segment') do
          DIV(class: 'ui three column equal height center aligned divided relaxed stackable page grid') do
            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/paint.png')
                'Simplicity'
              end
              P() { 'Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development, so you can focus on innovation and delivering end-user value.' }
              # A(href: '', class: 'ui secondary large button') { 'Simplicity' }
            end

            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/gear.png')
                'Isomorphic Ruby'
              end
              P() { 'One language. One model. One set of tests. The same business logic and domain models running on the clients and the server. You have unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code. Hyperstack lets you build beautiful interactive user interfaces in Ruby.' }
              # A(href: '', class: 'ui pink large button hyperlooppinkbutton') { 'Isomorphic Ruby' }
            end

            DIV(class: 'column') do
              H2(class: 'ui icon header') do
                IMG(class: 'ui icon image', src: 'dist/images/icons/plugin.png')
                'Complete Architecture'
              end
              P() { 'Everything has a place in our architecture. Components deliver interactive user experiences, Operations encapsulate business logic, Models magically synchronize data between clients and servers, Policies govern authorization and Stores hold local state.' }
              # A(href: '', class: 'ui black large button') { 'Complete Architecture' }
            end
          end
        end
      end
      AppFooter()
  end
end
