const { environment } = require('@rails/webpacker')
// // added below line per https://www.mashrurhossain.com/blog/rails6bootstrap4 (before module.exports)
// const webpack = require("webpack")

// environment.plugins.append("Provide", new webpack.ProvidePlugin({
// $: 'jquery',
// jQuery: 'jquery',
// Popper: ['popper.js', 'default']
// }))

module.exports = environment
