# Welcome to Hyperstack!

Hyperstack 1.0 is work-in-progress. Please consider everything in this repo as ALPHA.

### Hyperstack 1.0 Goals

* Solidify current Hyperloop DSLs, Public APIs, documentation and tutorials.
* Close any major issues, especially those that will potentially break or add significantly to DSLs or Public APIs.
* Provide an easy migration path from Hyperloop to Hyperstack
* Separate out client code from server code, i.e. client code will end up in a single NPM module, server code will end up in a single rails gem.  (See note #1)
* The boundary between client and server will be a set of well defined internal (but public) APIs between the client and server independent of any specific technology such as Rails or ActiveRecord. [See note #2)
* Use convention over configuration, and provide as simple as an install process as possible, perhaps as simple as adding a gem.
* Brand new website completely built with Hyperstack technology
* CI/CD build and deploy process for all NPM modules, Gems and the Webiste project

For a deeper philosophical understanding of where this is going checkout this [page](https://github.com/Hyperstack-org/website/wiki/Rethinking-Hyperstack)

### What does this all mean?

* All previous Hyperloop functionality will be packaged into a single `hyperstack-client` NPM module (all client-side code) and `hyperstack-rails` gem (all Rails server-side code)
* Incorporating all client code into NPM will enable us to better use Webpack and related technologies (such as tree shaking, etc.)  
* Separating the HyperComponent and HyperOperation server code and defining the existing HTTP protocols as public APIs will enable us to use different server side technologies.

* Separating HyperModel into a client only abstraction will enable HyperModel to be used independently of ActiveRecord.  For example you could use HyperModel as strictly a client abstraction and use an Operation to load and save data via an existing API.

### Path To Hyperstack 1.0

1. Release all current WIP on `edge` (or elsewhere) to a `0.9` set of gems, so that master = gems for all repos.
1. Release latest WIP `hyper-spec` to the hyper-stack github repo (this repo).  Contains lots of improvements and runs much faster. (See note #3 for why this is separate from item 1 above.)
1. During the following process move all current and newly deprecated features and name spaces (i.e. `Hyperloop::Component`) into separate require files that keeps backward compatibility, but reports uses of the deprecated feature.  
1. Create the following new gems, retaining relevant test specs.  (See note #4)
   * `hyper-component`, which will include the HyperComponent and HyperStore functionality, but no prerendering or other server-side functions.
   * `hyper-operation`, which will include the Operation and ServerOp functionality but without the Server side code.  In the process define the HyperOperation HTTP API and how push technologies can be plugged in. (See note #5)
   * `hyper-model` which will only include the client functionality (i.e. no load, save or data synchronization).
1. Build a `Hyperstack.js` NPM module from the above gems.
1. The code (and test specs) from each of the above gems that belongs server side will be moved to new gems as follows:
   * `hyper-component-rails` which will include the ability to mount and prerender components from rails views and controllers.
   * `hyper-operation-rails` which will respond to the ServerOp and related HTTP end points.  How specifically broadcasting is incorporated is TBD. (See note #2)
   * `hyper-model-active-record` which uses ActiveRecord as the persistence mechanism for hyper-model.  
1. Incorporate these gems plus the rails generator and installers into a `Hyperstack-rails` gem.
1. Once the initial system is running we will begin releasing a series of release candidates using the traditional rcxx nomenclature.
1. Meanwhile throughout this process keep updating documentation, and use the Doc site as an example of Hyperstack code.

### Future projects
This structure enables us to easily move forward independently on a number of often requested projects:
* Build a Neo4J or other non-sql persistence gem, i.e. `hyper-model-neo4js` which replaces, or even works along side `hyper-model-active-record`.
* Build a `hyper-rack` gem.  The `hyper-rails` gem probably continues to exist but only to hold rails specific installer code.  The `hyper-rack` gem allows other frameworks such as Sinatra to user Hyperstack.
* Cleanup HyperOperation's direct dependence on ActiveRecord, so that other persistence mechanisms can be used, especially Redis.
* Once we have a bit more experience with other non-AR ORMs, clean up the vector/tree structure that moves data between client and server in HyperModel, and cleanup and optimize the HyperModel server side code.
* Optimize and cleanup all the client side code.  In general hotspots should be written in JS, with the long term goal that all the Hyperstack client code is actually written in JS for speed reasons.  This will also enable future Ruby alternatives (such as Crystal) to plug right in.

### Potential Issues/Unknowns
Most everything above has been proven already, and we are really just doing a lot of code shuffling and clean up.  The exceptions are:
* How will prerendering work with all code being managed by webpack (probably not an issue, it just has not been done.)

### Notes:
1. Why not put the server side code into a Rack App?  Indeed, the long term goal would be to have a Rack app, which will support almost all (if not all) ruby server frameworks.  However we currently have working rails code so that is what we will begin with.  Because the server code will now be completely independent of the client side, we can easily change this later to a rack implementation without disturbing any existing application code.  We did discuss taking this opportunity to changing to Rack right now, but hopefully once the `Hyperstack-rails` gem is published, someone can volunteer to turn it into a rack application.
2. For HTTP requests we will define a simple API based on the current protocol used by ServerOps.  The problem is that there is no standard way to define data to be pushed, and each push technology (i.e. action-cable, pusher.com, etc) has small client side modules that hide protocol details.  Likewise each push technology has specific mechanisms server-side to operate the push protocol.  We will have to experiment with various configuration mechanisms, and see what works best.
3. The current "WIP" HyperSpec is not 100% compatible with current HyperSpec so it will be released directly to the Hyperstack repo.  As there is no dependency between HyperSpec and the rest of Hyperloop/Hyperstack you can just keep using the currently released hyperspec if you want.
4. HyperComponent and HyperModel will only run on the client, so eventually these could be directly built as NPM modules.
5. HyperOperation is based largely on trailblazer Operations, and thus developers may wish to use them on the Server as well as the client.  The base Operation class has no ability to deal with remotely invoking or responding to an Operation hosted on the Server.   This functionality is provided by the ServerOp subclass.  The new HyperOperation gem will only include the client side code for the ServerOp, and the push receiver will be stubbed somehow to allow for multiple push technologies (See note #2 above)
6. Hyperstack, previously known as RubyHyperloop, has been renamed and moved to a new website as we move towards our 1.0 release. First off, why are we renaming to Hyperstack?  We love the Hyperloop name, as we hope Hyperloop is the "Ruby on Rails" of the future, and it speaks to the full circle loop connecting client to server and back again, as well as plays on the famous React "Flux Loop".  So why change?  The biggest reason is simply that the name too heavily conflicts with Hyperloop (the train) especially when it comes to getting domain names, or doing web searches.  Secondarily there is the notion that we are providing a "full stack" framework in the truest sense of the word, and thus it is a Hyperstack.   

