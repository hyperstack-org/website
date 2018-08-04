# Installation

There are several ways to install Hyperloop into your development environment.

+ Running exclusively in your browser with Hyperloop.js
+ Integrating with the Rails Asset Pipeline

## With Ruby On Rails

Hyperloop has been tested with the most recent Ruby On Rails verions:<br> Rails (~> 4.2), Rails (~> 5.0) and the last Rails (5.1.0). For the final Rails (~> 5.1.0), there are still few points to be aware of [Hyperloop and Rails (~> 5.1.0)](/installation-rails5.1.0)

### Ruby On Rails installation

If you don't already have Ruby On Rails installed on your local machine you can install it by following one of several existing tutorials (for exemple: [{ Setup Ruby On Rails on
Ubuntu 16.04 }](https://gorails.com/setup/ubuntu/16.04)) or you can use a cloud development environment like Cloud9 (follow our toturial [Hyperloop and Cloud9 setup](/tutorials/hyperlooprails/cloud9))

### Hyperloop setup

In your `Gemfile`

```ruby
gem 'hyperloop'
```

then

```ruby
bundle install
```

Once the Hyperloop Gem and all its dependencies have been installed, it's time to run the hyperloop install generator.

```ruby
rails g hyperloop:install
```

The generator creates the hyperloop structure inside the `/app` directory :

```
/app/hyperloop/
/app/hyperloop/components
/app/hyperloop/models
/app/hyperloop/operations
/app/hyperloop/stores
```

And updates your `app/assets/javascripts/application.js` file adding this line:

```javascript
//= require hyperloop-loader
```

To be sure everything is setting up correctly, check your `app/assets/javascripts/application.js`:

```javascript
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require hyperloop-loader

```

If you don't have already Ruby On Rails installed on your local machine and you want to try Hyperloop, you can setup a workspace in [Cloud9](https://c9.io/) and also enjoy the co-development ability.

For that just follow our [{ Hyperloop and cloud9 setup }](/tutorials/hyperlooprails/cloud9) tutorial.

### Simple HelloWorld

You can now test it by creating a very simple Component by running the hyperloop generator :

```
rails g hyper:component Helloworld
```

You can view the new Component created in `/app/hyperloop/components/`

Modify your `routes.rb`:

```ruby
root 'hyperloop#helloworld'
```

Start your Rails server and browse `http://localhost:3000`.
<br><br>
You should see `Hello world` displayed by the Component.

<i class="flaticon-signs"></i> A component can be rendered in different ways, from a controller or view file for example. Please consult the documentation: [{ Elements and rendering }](/docs/components/docs#elements-and-rendering)

### Advanced configuration

You can find detailed information about Hyperloop configuration files and the advanced options on this page: <br>

[{ Advanced configuration }](/docs/advancedconfiguration)
