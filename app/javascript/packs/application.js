/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

// Import all the modules
import React from 'react';
import ReactDOM from 'react-dom';
import * as Sem from 'semantic-ui-react';
import BurgerMenu from 'react-burger-menu';
import YahooSticky from 'react-stickynode';
import PerfectScrollbar from 'react-perfect-scrollbar'
import Marked from 'marked';
import CodeMirror from 'react-codemirror';
import CodeMirrorRuby from 'codemirror/mode/ruby/ruby';
import * as Scroll from 'react-scroll';

// Semantic CSS built with gulp (see readme)
require('../../../vendor/semantic/dist/semantic.css');

// we do not need all of these
global.RsLink       = Scroll.Link;
global.RsElement    = Scroll.Element;
global.RsEvents     = Scroll.Events;
global.RsScroll     = Scroll.animateScroll;
global.RsScroller    = Scroll.scroller;
global.RsScrollSpy  = Scroll.scrollSpy;

import DatePicker from 'react-datepicker';
import moment from 'moment';

// for opal/hyperloop modules to find React and others they must explicitly be saved
// to the global space, otherwise webpack will encapsulate them locally here
global.React = React;
global.ReactDOM = ReactDOM;
global.Sem = Sem;
global.BurgerMenu = BurgerMenu;
global.YahooSticky = YahooSticky;
global.PerfectScrollbar = PerfectScrollbar;
global.Marked = Marked;
global.ReactCodeMirror = CodeMirror;
global.CodeMirrorRuby = CodeMirrorRuby;
global.DatePicker = DatePicker
global.moment = moment
