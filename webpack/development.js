// require requirements used below
const path = require('path');
const webpack = require('webpack');
const chokidar = require('chokidar'); // for watching app/view
const stringify = require('json-stringify-safe');
const WebSocket = require('ws');
const OpalWebpackResolverPlugin = require('opal-webpack-resolver-plugin'); // to resolve ruby files

module.exports = {
    context: path.resolve(__dirname, '..'),
    mode: "development",
    optimization: {
        minimize: false // dont minimize in development, to speed up hot reloads
    },
    performance: {
        maxAssetSize: 20000000, // hyperloop is a lot of code
        maxEntrypointSize: 20000000
    },
    // use this or others below, disable for faster hot reloads
    devtool: 'source-map', // this works well, good compromise between accuracy and performance
    // devtool: 'cheap-eval-source-map', // less accurate
    // devtool: 'inline-source-map', // slowest
    // devtool: 'inline-cheap-source-map',
    entry: {
        app: ['./assets/app.js'], // entrypoint for hyperloop
        // have to add 'webpack-hot-client/client' for each additional entry point for hot reloading to work
        // website: ['webpack-hot-client/client', './assets/website.js'] // entrypoint for website
    },
    output: {
        // webpack-serve keeps the output in memory
        filename: '[name]_development.js',
        path: path.resolve(__dirname, '../public/'),
        publicPath: 'http://localhost:3035/'
    },
    resolve: {
        plugins: [
            // this makes it possible for webpack to find ruby files
            new OpalWebpackResolverPlugin('resolve', 'resolved')
        ]
    },
    plugins: [
        // both for hot reloading
        new webpack.NamedModulesPlugin()
    ],
    module: {
        rules: [
            {
                // loader for .scss files
                // test means "test for for file endings"
                test: /\.scss$/,
                use: [
                    {
                        loader: "style-loader",
                        options: {
                            hmr: true
                        }
                    },
                    {
                        loader: "css-loader",
                        options: {
                            sourceMap: true, // set to false to speed up hot reloads
                            minimize: false // set to false to speed up hot reloads
                        }
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            includePaths: [path.resolve(__dirname, '../assets')],
                            sourceMap: true // set to false to speed up hot reloads
                        }
                    }
                ]
            },
            {
                // loader for .css files
                test: /\.css$/,
                use: [
                    {
                        loader: "style-loader",
                        options: {
                            hmr: true
                        }
                    },
                    {
                        loader: "css-loader",
                        options: {
                            sourceMap: true, // set to false to speed up hot reloads
                            minimize: false // set to false to speed up hot reloads
                        }
                    }
                ]
            },
            {
                test: /\.(png|svg|jpg|gif)$/,
                use: [
                    'file-loader'
                ]
            },
            {
                test: /\.(woff|woff2|eot|ttf|otf)$/,
                use: [
                    'file-loader'
                ]
            },
            {
                // opal-webpack-loader will compile and include ruby files in the pack
                test: /\.(rb|js.rb)$/,
                use: [
                    'opal-webpack-loader'
                ]
            }
        ]
    },
    // configuration for webpack serve
    serve: {
        dev: {
            publicPath: '/',
            headers: {
                'Access-Control-Allow-Origin': '*'
            },
            watchOptions: {

            }
        },
        hot: {
            host: 'localhost',
            port: '8081',
            allEntries: true, // this doesn't seem to work
            hmr: true
        },
        host: "localhost",
        port: 3035,
        content: path.resolve(__dirname, '../public'),
        clipboard: false, // dont copy url to clipboard
        open: false, // dont open browser
        on: {
            // this configuration is for triggering a hot reload for views
            "listening": function (server) {
                const socket = new WebSocket('ws://localhost:8081');
                const watchPath = path.resolve(__dirname, '../views'); // adjust path here if needed
                const options = {};
                const watcher = chokidar.watch(watchPath, options);

                watcher.on('change', () => {
                    const data = {
                        type: 'broadcast',
                        data: {
                            type: 'window-reload',
                            data: {},
                        },
                    };

                    socket.send(stringify(data));
                });

                server.server.on('close', () => {
                    watcher.close();
                });
            }
        }
    }
};
