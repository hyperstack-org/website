# Tools

## Hyper-console

Hyper-Console will open a new popup window, that is running an IRB style read-eval loop. The console window will compile what ever ruby code you type, and if it compiles, will send it to your main window for execution. The result (or error message) plus any console output will be displayed in the console window.

## Hyper-spec

With Hyper-Spec you can run isomorphic specs for all your Hyperloop code using RSpec. Everything runs as standard RSpec test specs.

Hyperloop wants to make the server-client divide as transparent to the developer as practical. Given this, it makes sense that the testing should also be done with as little concern for client versus server.

Hyper-spec allows you to directly use tools like FactoryGirl (or Hyperloop Operations) to setup some test data, then run a spec to make sure that a component correctly displays, or modifies that data. You can use Timecop to manipulate time and keep in sync between the server and client. This makes testing easier and more realistic without writing a lot of redundant code.

## Hyper-trace

Method tracing and conditional break points for Opal and Hyperloop debug.

Typically you are going to use this in Capybara or Opal-RSpec examples that you are debugging.

Hyper-trace adds a hypertrace method to all classes that you will use to switch on tracing and break points.

## Opal Hot Reloader

Opal Hot Reloader is for pure programmer joy (not having to reload the page to compile your source) and the Opal Console is incredibly useful to test how Ruby code compiles to JavaScript.

Opal Hot Reloader is going to just dynamically (via a websocket connection) chunks of code in the page almost instaneously.

## Debugging tips

Tips, good practice will help you debugging your Hyperloop application.

### JavaScript Console

At any time during program execution you can breakout into the JavaScript console by simply adding a line of back-ticked JavaScript to your ruby code:

`debugger;`

If you have source maps turned on you will then be able to see your ruby code (and the compiled JavaScript code) and set browser breakpoints, examine values and continue execution. See Opal Source Maps if you are not seeing source maps.

You can also inspect ruby objects from the JavaScript console.

Here are some tips: https://dev.mikamai.com/2014/11/19/3-tricks-to-debug-opal-code-from-your-browser/

### Puts is your friend

Anywhere in your HyperReact code you can simply puts any_value which will display the contents of the value in the browser console. This can help you understand React program flow as well as how data changes over time.

```ruby
class Thing < Hyperloop::Component
  param initial_mode: 12

  before_mount do
    state.mode! params.initial_mode
    puts "before_mount params.initial_mode=#{params.initial_mode}"
  end

  after_mount do
    @timer = every(60) { force_update! }
    puts "after_mount params.initial_mode=#{params.initial_mode}"
  end

  render do
    div(class: :time) do
      puts "render params.initial_mode=#{params.initial_mode}"
      puts "render state.mode=#{state.mode}"
      ...
      end.on(:change) do |e|
        state.mode!(e.target.value.to_i)
        puts "on:change e.target.value.to_i=#{e.target.value.to_i}"
        puts "on:change (too high) state.mode=#{state.mode}" if state.mode > 100
      end
    end
  end
end
```
