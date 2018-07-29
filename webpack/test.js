const path = require('path');
const OpalWebpackResolverPlugin = require('opal-webpack-resolver-plugin');

module.exports = {
    context: path.resolve(__dirname, '..'),
    mode: "test",
    optimization: {
        minimize: false
    },
    performance: {
        maxAssetSize: 20000000,
        maxEntrypointSize: 20000000
    },
    entry: {
        app: './assets/app.js',
    },
    output: {
        filename: '[name]_test.js',
        path: path.resolve(__dirname, '../public'),
        publicPath: '/'
    },
    resolve: {
        plugins: [
            new OpalWebpackResolverPlugin('resolve', 'resolved')
        ]
    },
    module: {
        rules: [
            {
                test: /\.scss$/,
                use: [
                    { loader: "style-loader" },
                    { loader: "css-loader" },
                    {
                        loader: "sass-loader",
                        options: {
                            includePaths: [path.resolve(__dirname, '../assets')]
                        }
                    }
                ]
            },
            {
                test: /\.css$/,
                use: [
                    'style-loader',
                    'css-loader'
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
                test: /\.(rb|js.rb)$/,
                use: [
                    'opal-webpack-loader'
                ]
            }
        ]
    }
};

