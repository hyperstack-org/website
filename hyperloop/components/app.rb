class App < Hyperloop::Component
  render(DIV) do
    Sem.Button(primary: true) { "this works" }
  end
end
