class TestComp < Hyperloop::Component

  render(DIV) {
    puts "rubyglobalIndex : #{TestStore.rubyglobalIndex}"
    H1() {"RESULT : #{TestStore.rubyglobalIndex}"}
  }

end