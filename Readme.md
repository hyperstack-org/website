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

+ All the pages are loaded into a store `SiteStore` which is initialised once on startup. This store is structured like this:

+ Basic data structure: `Site` has_many `sections` has_many `pages`
+ Each `page` has a TOC and a Body

+ `SiteStore` which is a singleton `SiteStore` store
+ `.section_stores` which is a hash of SectionStores accessed through `:section_name`
+ `.section` which is a `SectionStore` store
+ `.pages` which is an array of hashes

So to get the friendly_doc_name of the first page in the 'start' section:

+ `SiteStore.section_stores[:start].section.pages.first[:firendly_doc_name]`

# Deploy

+ push to edge or master
+ `https://travis-ci.org/hyperstack-org/hyperstack-website/builds`
