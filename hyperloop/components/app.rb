class App < Hyperloop::Component
  render(DIV) do
    H1 { 'Hyperstack.org website'}
    Sem.Button(primary: true) { "push me for a good time" }
    P { "Warning: Failed prop type: In component `App`
        Provided prop `className` not specified in spec
        in App (created by App)
        in App" }
    P { "Jan, I think this is coming from the way Sem is being imported? See patches/auto_import which I ntook from Pinta" }
  end
end
