// /* eslint no-console:0 */
// // This file is automatically compiled by Webpack, along with any other files
// // present in this directory. You're encouraged to place your actual application logic in
// // a relevant structure within app/javascript and only use these pack files to reference
// // that code so it'll be compiled.
// //
//
// console.log('Hello World from Webpacker')
//
// // Import all the modules
// import React from 'react';
// import ReactDOM from 'react-dom';
// import * as Sem from 'semantic-ui-react';
// import BurgerMenu from 'react-burger-menu';
// import YahooSticky from 'react-stickynode';
// import PerfectScrollbar from 'react-perfect-scrollbar'
// import Marked from 'marked';
// import CodeMirror from 'react-codemirror';
// import CodeMirrorRuby from 'codemirror/mode/ruby/ruby';
//
// // for opal/hyperloop modules to find React and others they must explicitly be saved
// // to the global space, otherwise webpack will encapsulate them locally here
// global.React = React;
// global.ReactDOM = ReactDOM;
// global.Sem = Sem;
// global.BurgerMenu = BurgerMenu;
// global.YahooSticky = YahooSticky;
// global.PerfectScrollbar = PerfectScrollbar;
// global.Marked = Marked;
// global.CodeMirror = CodeMirror;
// global.CodeMirrorRuby = CodeMirrorRuby;
//

import React from 'react';
import ReactDOM from 'react-dom';
import * as History from 'history';
import * as ReactRouter from 'react-router';
import * as ReactRouterDOM from 'react-router-dom';
import * as ReactRailsUJS from 'react_ujs';
import ActionCable from 'actioncable';
// import jQuery from 'jquery';
import * as Sem from 'semantic-ui-react';
import BurgerMenu from 'react-burger-menu';
import YahooSticky from 'react-stickynode';
import PerfectScrollbar from 'react-perfect-scrollbar'
import Marked from 'marked';
import CodeMirror from 'react-codemirror';
import CodeMirrorRuby from 'codemirror/mode/ruby/ruby';
import * as Scroll from 'react-scroll';

// we do not need all of these
global.RsLink       = Scroll.Link;
global.RsElement    = Scroll.Element;
global.RsEvents     = Scroll.Events;
global.RsScroll     = Scroll.animateScroll;
global.RsScroller    = Scroll.scroller;
global.RsScrollSpy  = Scroll.scrollSpy;

global.React = React;
global.ReactDOM = ReactDOM;
global.History = History;
global.ReactRouter = ReactRouter;
global.ReactRouterDOM = ReactRouterDOM;
global.ReactRailsUJS = ReactRailsUJS;
global.ActionCable = ActionCable;
// global.jQuery = jQuery;
// global.$ = jQuery;
global.Sem = Sem;
global.BurgerMenu = BurgerMenu;
global.YahooSticky = YahooSticky;
global.PerfectScrollbar = PerfectScrollbar;
global.Marked = Marked;
global.CodeMirror = CodeMirror;
global.CodeMirrorRuby = CodeMirrorRuby;


import init_app from 'hyperstack_webpack_loader.rb';

init_app();
Opal.load('hyperstack_webpack_loader');
if (module.hot) {
    module.hot.accept('./app.js', function () {
        console.log('Accepting the updated app module!');
    })
}
