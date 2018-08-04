var webpack = require('webpack');
var path = require('path');

var BUILD_DIR = path.resolve(__dirname, 'dist');

var config = {
  entry: ['./client.js'],
  output: {
    path: BUILD_DIR,
    filename: 'bundle.js'
  },
  module: {

    loaders: [
          { test: /\.css$/,
            loader: "style-loader!css-loader"
          }
    ]

  }

};

module.exports = config;
