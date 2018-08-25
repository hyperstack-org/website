const path = require('path');
const OpalWebpackResolverPlugin = require('opal-webpack-resolver-plugin');
const CompressionPlugin = require("compression-webpack-plugin")
const  ManifestPlugin = require('webpack-manifest-plugin');

module.exports = {
    parallelism: 8,
    context: path.resolve(__dirname, '../..'),
    mode: "production",
    optimization: {
        minimize: true
    },
    performance: {
        maxAssetSize: 20000000,
        maxEntrypointSize: 20000000
    },
    entry: {
        app_packs: './app/javascript/app.js'
    },
    plugins: [
        new CompressionPlugin({ test: /\.js/ }),
        new ManifestPlugin()
    ],
    output: {
        filename: '[name]-[chunkhash].js',
        path: path.resolve(__dirname, '../../public/packs'),
        publicPath: '/packs/'
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
                    {
                        loader: "style-loader",
                        options: {
                            hmr: false
                        }
                    },
                    {
                        loader: "css-loader"
                    },
                    {
                        loader: "sass-loader",
                        options: {
                            includePath: [
                                path.resolve(__dirname, '../../app/assets/stylesheets')
                            ]
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
