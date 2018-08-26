# Hyperstack Website

[![Build Status](https://travis-ci.org/hyperstack-org/hyperstack-website.svg?branch=master)](https://travis-ci.org/hyperstack-org/hyperstack-website)
[![Coverage Status](https://coveralls.io/repos/github/hyperstack-org/hyperstack-website/badge.svg?branch=master)](https://coveralls.io/github/hyperstack-org/hyperstack-website?branch=master)

## Goals

+ Firstly, it is the main documentation site for Hyperstack.org https://hyperstack.org
+ Secondly, it stands as showcase for Hyperstack. Please clone this repo, learn from how it works, and if you can improve anything we would love to see a PR!

## Website functionality

+ All pages are dynamically loaded from Github
+ Conversion from Markdown to HTML is done on the fly on the client (using a JS component called Marked.js)
+ The table of contents (TOC) is dynamically created from the markdown an all of the site navigation is dynamically created
+ Full text search is also dynamic, with the indexes created in the client as the pages are loaded
+ Each page has an 'Improve this Page' button which will result in a PR against the correct page, in the correct repo on the correct branch (edge)

## Technology

+ Hyperstack (HS2) from Jan Biedermann repos
+ Multiple JS libraries used (for markdown conversion and full text indexing)
+ All JS libraries added via `Yarn` 
+ Reactivity from React, ReactRouter
+ Semantic UI React as the main stylesheet
+ Latest version of Rails
+ Hosted on Heroku
+ Travis build process for CI/CD deployments to edge and master

## Setup

+ `bundle`
+ `yarn`

## Run

+ `foreman start`
+ `http://localhost:3000/`

## Deploy

+ Deployments are all through Travis
+ You can see the deploy history here: https://travis-ci.org/hyperstack-org/hyperstack-website/builds
+ Any push to edge or master triggers a deployment

## How the code works

### Routing

All Rails routes go to a Hyperstack created Controller and View `match '*all', to: 'hyperloop#AppRouter', via: [:get]` which loads and renders the AppRouter Component, which happens to be a router (actually ReactRouter under the covers).

The router then simply looks at the path and renders the correct Component, passing in parameters from the path.

```ruby
# /app/hyperloop/router/app_router.rb
class AppRouter < Hyperstack::Router
  history :browser

  route do
    Switch do
      Route('/', exact: true, mounts: HomePage)
      Route('/docs', exact: true, mounts: DocsPage)
      Route('/docs/:section_name', exact: true, mounts: DocsPage)
      Route('/docs/:section_name/:page_name', exact: true, mounts: DocsPage)
      Route('/searchresult', exact: false, mounts: SearchResultPage)
    end
  end
end
```

### The HomePage Component

Our root route `/` renders a Component called `HomePage`. If you are brand new to HYperstack, this is a good first component to look at as it is dead simple - it renders a static HTML page. You will find it at `/app/hyperloop/components/home/home_page.rb`

Note the Component structure and then have a look at the `render` macro.

```ruby
# /app/hyperloop/components/home/home_page.rb
render do
  DIV(id: 'example', class: 'index') do
    DIV(class: 'page_wrap full height') do
      AppMenu(section: 'home')
      mast_head
      stack_overview
      three_columns_of_text
      SearchResultModal(history: history)
    end
    AppFooter()
  end
end
```

In the code above, note the following:

+ Our HTML tags `DIV`, `INPUT`, `A`, etc are always in capitals. This is purely a convention which we believe makes the code more readable, after-all, this code is rendering a HTML page. If this hurts your eyes (as a Ruby purist), you can use the lower case form which works just the same.
+ Every Component must implement a `render` block which must return just one DOM node. In this case it is returning a `DIV`. You will see `render(DIV)` elsewhere in the code which is shorthand.
+ Components render child Components and data is passed in one direction, from parent to child. React constantly re-renders the page based on the current state of the data. This is the simple, beautiful secret to React. Once you fully grasp this one simple point. all of React design and thinking will make sense. We will speak about Stores, which are a way of passing data between components, a little later.
+ In the render block above, we render a combination of Components and methods in the class. As a general rule of thumb, its best to keep the render block as readable as possible (for example the `mast_head` method renders all the messy mast head HTML) and move code that is likely to be shared into its own Component. A perfect example is the `AppMenu` Component which is obviously needed on all pages on this site.

### AppStore behind the scenes

Stores hold data and components watch for changes (we call them mutations) of that data and re-render when state data held in a Store changes.

When this application starts, the Hyperstack Stores get initialised and start their work. The `AppStore` singleton goes about loading and converting all the pages from Github. Basic data structure: `AppStore` has_many `SectionStores` has_many `pages`.

+ `AppStore` which is a singleton `AppStore` store
+ `.section_stores` which is a hash of SectionStores {'docs' => SectionStore}
+ `.pages` which is an array of hashes

So to get the friendly_doc_name of the first page in the 'dsl' section:

+ `AppStore.section_stores['dsl'].pages.first['friendly_doc_name']`

Once the stores are loaded (and the pages converted) the rest of the site is ready to render.
