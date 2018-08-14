# Hyperstack Website

[![Build Status](https://travis-ci.org/hyperstack-org/hyperstack-website.svg?branch=master)](https://travis-ci.org/hyperstack-org/hyperstack-website)
[![Coverage Status](https://coveralls.io/repos/github/hyperstack-org/hyperstack-website/badge.svg?branch=master)](https://coveralls.io/github/hyperstack-org/hyperstack-website?branch=master)

This project is work in progress, not complete yet!

+ Hyperloop from edge branch
+ React, ReactRouter via Yarn and Webpack

# Setup

+ `bundle`
+ `yarn`

# Run

+ `foreman start`
+ `http://localhost:3000/`

# How this site works

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

When working with the hash of `section_stores`, we sometimes do not know their key names, so you see things like  `SiteStore.section_stores.first[0]` to get the key name of the first section store. This can be a little ugly.

# Deploy

+ push to edge or master
+ `https://travis-ci.org/hyperstack-org/hyperstack-website/builds`
