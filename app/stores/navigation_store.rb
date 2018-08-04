class NavigationStore < Hyperloop::Store

  state accordionindex: -1, scope: :shared, reader: true
  state slug: "", scope: :shared, reader: true

end