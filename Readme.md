# Hyperloop Website V3

## Work in progress!

The new website will:

+ be a 100% Hyperloop SPA (featuring Components, Stores, Routes and Operations)
+ be built with Opal and Webpack (no Middleman)
+ demonstrate the use of hyperloop-js as a simple alternative deployment method (hyperloop-js coming in via NPM)
+ consist of just three files (index.html, app.js and app.css)
+ have super fast client-side search
+ will use HyperRouter for routing
+ ultra-responsive UI based on SemanticUIReact (we are ditching bootstrap)
+ work online and offline
+ HTTP.get all DOCS pages directly from the gems with client-side markdown
+ have live editing with (hopefully) a Ruby linter and good error messages
+ will be as SEO friendly as the current site (through pre-rendering)
+ be beautiful to behold!

## Setup and build

### Setup

+ `bundle`
+ `yarn`

### Build

+ To build packs.js and app.js: `yarn run webpack` (-p for production mode)
+ To build app.js: `bundle exec rake build`

## Running the server

We use Rack and OpelHotReloader as a development environment. Website Components are rebuilt by sprockets on server start. You will need to build bundle.js (`yarn run webpack`).

To start the server:

`foreman start`
Browse `http://localhost:9292/`

## Adding pages and sections

### Adding a section

+ Add a route to the Router `app/components/router/app_router.rb`
+ Add a menu item to `app/components/shared/app_menu.rb`
+ Create folder in components and add a `xxx_page.rb` component which will be rendered by the router. See one of the other examples, each folder has three files - `xxx_page.rb`, `xxx_body.rb` and `xxx_sidebar.rb` (assuming your want the three column layout)

### Pages (PageBody and PageToc)

Not all sections need to load pages, but if you do then:

+ See the `init` method in `app/stores/site_store`, you will need to add a loader which loads the pages an sets a new key in the `@section_stores` hash
+ Pass the store to `PageBody` and `PageToc` and they will redner the Toc and current page and will also handle all navigation and loading of the correct page

## Structure

+ There is one singleton Store - `SiteStore` which contains many instances of `SectionStore` (one per section)


## Code blocks

### Runable code blocks

Code blocks need to render properly in Github and also on the site. Some code blocks are live and runanle.

Normal code block - (three-backticks ruby)
<PRE>
```ruby
class MyComp < Hyperloop::Component
  render(DIV) do
    H1 { 'Hello world' }
  end
end
```
</PRE>

Runable code block - (three-backticks ruby runable)

<PRE>
```ruby runable
class MyComp < Hyperloop::Component
  render(DIV) do
    H1 { 'Hello world' }
  end
end
```
</PRE>

All runable code blocks must have a Hyperloop Component `class Anything < Hyperloop::Component` somewhere near the beginning of the code block.
