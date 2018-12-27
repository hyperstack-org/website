# class SidebarMenu < HyperComponent
#
#
#   render do
#
#     BurgerMenu.Push(
#       pagewrapid: 'page-wrap',
#       outercontainerid: 'index',
#       isOpen: (SidebarStore.visible ? true : false),
#       customBurgerIcon: false,
#       customCrossIcon: false,
#       disableOverlayClick: true
#       ) do
#
#       Link('/', class: 'header') do
#         IMG(src: 'dist/images/hyperloop-logo-title.png')
#       end
#
#
#       Link('/docs/start/components') { 'GET STARTED' }
#       Link('/docs', class: 'item') { 'DOCUMENTATION' }
#
#     end
#
#     # Sem.Sidebar(id: 'menu', animation: 'overlay', visible: (SidebarStore.visible ? true : false), className: 'menu vertical inverted hyperloopgreen') do
#     # #DIV(id: 'menu', class: 'ui push left sidebar menu vertical inverted hyperloopgreen') do
#
#
#     #   DIV(class: 'item') do
#     #     A(href: '/', class: 'ui logo icon image') do
#     #       IMG(src: 'dist/images/hyperloop-logo.png')
#     #     end
#     #     Link('/') do
#     #       B() { 'Hyperloop' }
#     #     end
#     #   end
#
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#
#     #       Link('/start', class: 'item') { 'GET STARTED' }
#
#     #     end
#     #   end
#
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#     #       Link('/installation', class: 'item') { 'INSTALLATION' }
#     #     end
#
#     #   end
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#     #       Link('/tutorials', class: 'item') { 'TUTORIALS' }
#     #     end
#     #   end
#
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#     #       Link('/docs', class: 'item') { 'DOCUMENTATION' }
#     #     end
#     #   end
#
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#     #       Link('/gems', class: 'item') { 'GEMS' }
#     #     end
#     #   end
#
#     #   DIV(class: 'item') do
#     #     DIV(class: 'ui small inverted header') do
#     #       Link('/tools', class: 'item') { 'TOOLS' }
#     #     end
#     #   end
#
#
#     # end
#
#   end
#
#
#
#
# end
