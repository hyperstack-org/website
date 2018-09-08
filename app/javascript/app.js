// /* eslint no-console:0 */
// // This file is automatically compiled by Webpack, along with any other files
// // present in this directory. You're encouraged to place your actual application logic in
// // a relevant structure within app/javascript and only use these pack files to reference
// // that code so it'll be compiled.
// //
//
// console.log('Hello World from Webpacker')
//
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

// for opal/hyperloop modules to find React and others they must explicitly be saved
// to the global space, otherwise webpack will encapsulate them locally here
global.React = React;
global.ReactDOM = ReactDOM;
global.Sem = Sem;
global.BurgerMenu = BurgerMenu;
global.YahooSticky = YahooSticky;
global.PerfectScrollbar = PerfectScrollbar;
global.Marked = Marked;
global.CodeMirror = CodeMirror;
global.CodeMirrorRuby = CodeMirrorRuby;
