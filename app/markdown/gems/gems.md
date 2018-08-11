# Hyperloop Gems

The Hyperloop framework comprises of a family of gems which for the most part can be used independently (though some do depend on each other).

See [Docs](/docs/dsl_overview) for detailed information on how to use these gems or [Tutorials](/tutorials) for working examples.

## Gems family and dependencies

### Installation Gems

+ Hyperloop
https://github.com/ruby-hyperloop/hyperloop
One step integration of Hyperloop Gems with Rails.
It is the recommended approach to enjoy all Hyperloop functionalities. You can still control which code packages are loaded on client.

+ Hyperloop.js
https://github.com/ruby-hyperloop/hyperloop-js
Hyperloop for static sites, with no build process needed.

### Core Hyperloop Gems

All Gems below come with Hyperloop installation Gem but they can be installed independently.

+ Hyper-Component
https://github.com/ruby-hyperloop/hyper-react
Hyper-component gem implements Hyperloop's Components.
Components provides a Ruby DSL to Facebook's React. Much of the documentation on this site covers usage of this Gem.

+ Hyper-Store
https://github.com/ruby-hyperloop/hyper-store
The hyper-store gem implements Hyperloop's Stores.
Stores hold application state. Stores are Ruby classes that keep the dynamic parts of the state in special state variables

+ Hyper-Model
https://github.com/ruby-hyperloop/hyper-mesh
The hyper-model gem implements Hyperloop's Models and Policies. Providing Hyperloop Models as isomorphic ActiveRecord models. In addition your ActiveRecord models stay connected to your clients via push notifications

+ Hyper-Operation https://github.com/ruby-hyperloop/hyper-operation
Hyper-Operation gem implements Hyperloop's Operations.
Operations</b> encapsulate business logic

+ Hyper-Router
https://github.com/ruby-hyperloop/reactrb-router/tree/v2-4-0'
The hyper-router gem provides a Ruby DSL to Facebook's React Router which is a React component that loads other components depending on the current URL.

### Tools, Testing and Debugging Gems

+ Hyper-Spec
https://github.com/ruby-hyperloop/hyper-spec
With hyper-spec you can run isomorphic specs for all your Hyperloop code using RSpec. Everything runs as standard RSpec test specs.

+ Hyper-console https://github.com/ruby-hyperloop/hyper-console
The hyper-console gem adds the console method to Kernel. If you call console from anywhere in your client code, it will open a new popup window, that is running an IRB style read-eval loop. The console window will compile what ever ruby code you type, and if it compiles, will send it to your main window for execution. The result (or error message) plus any console output will be displayed in the console window.

+ Hyper-Trace
https://github.com/ruby-hyperloop/hyper-trace
Method tracing and conditional breakpoints for Opal Ruby.

+ Opal Hot Reloader
https://github.com/fkchang/opal-hot-reloader
For pure programmer joy, no more page refreshes.

+ Opal Console
https://github.com/fkchang/opal-console
Opal in your browser. Great for testing.
