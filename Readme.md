# Hyperstack Website

[![Build Status](https://travis-ci.org/hyperstack-org/hyperstack-website.svg?branch=master)](https://travis-ci.org/hyperstack-org/hyperstack-website)
[![Coverage Status](https://coveralls.io/repos/github/hyperstack-org/hyperstack-website/badge.svg?branch=master)](https://coveralls.io/github/hyperstack-org/hyperstack-website?branch=master)

## Goals

+ Firstly, it is the main documentation site for Hyperstack.org
+ Secondly, it stands as an example of what can be achieved in Hyperstack as the technology stack is completely Hyperstack. Please clone this repo, learn from how it works and if you can improve anything we would love to see a PR!

## Website functionality

+ All pages are dynamically loaded from Github
+ Conversion from Markdown to HTML is done on the fly on the client (using a JS component called Marked.js)
+ The table of contents (TOC) is dynamically created from the markdown an all of the site navigation is dynamically created
+ Full text search is also dynamic, with the indexes created in the client as the pages are loaded
+ Each page has an 'Improve this Page' button which will result in a PR against the correct page, in the correct repo on the correct branch (edge)

## Technology

+ Hyperloop from edge branch (this will change to Hyperstack soon)
+ Multiple JS libraries used (for markdown conversion and full text indexing)
+ React, ReactRouter via Yarn and Webpack
+ Semantic UI React as the main stylesheet
+ Latest version of Rails
+ Hosted on Heroku
+ Travis build process for CI/CD deployments to edge and master

# Setup

+ `bundle`
+ `yarn`

# Run

+ `foreman start`
+ `http://localhost:3000/`

# How the code works

## Data Structure

+ All the pages are loaded into a store `SiteStore` singleton which is initialised once on startup.
+ Basic data structure: `SiteStore` has_many `SectionStores` has_many `pages`
+ `SiteStore` which is a singleton `SiteStore` store
+ `.section_stores` which is a hash of SectionStores {'docs' => SectionStore}
+ `.pages` which is an array of hashes

So to get the friendly_doc_name of the first page in the 'dsl' section:

+ `SiteStore.section_stores['dsl'].pages.first['friendly_doc_name']`

To get the HTML of that page:

+ `SiteStore.section_stores['dsl'].pages.first['html']`

When working with the hash of `section_stores`, we sometimes do not know their key names, so you see things like  `SiteStore.section_stores.first[0]` to get the key name of the first section store.

# Deploy

+ Deployments are all through Travis
+ You can see the deploy history here: `https://travis-ci.org/hyperstack-org/hyperstack-website/builds`
+ Any push to edge or master triggers a deployment
