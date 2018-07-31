class Semantic < React::NativeLibrary
  imports 'Sem'
end

class App < Hyperloop::Component
  param class_name: 'test'
  render(DIV) do
    Sem.Button(primary: true) { "this shows the wrror" }
    P { "Warning: Failed prop type: In component `App`
        Provided prop `className` not specified in spec
        in App (created by App)
        in App" }
    P { "Jan, I think this is coming from the way Sem is being imported? See patches/auto_import which I ntook from Pinta" }

    Semantic.Button(primary: true) { "this works" }

  end
end
