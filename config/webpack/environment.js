const { environment } = require('@rails/webpacker')
// const erb = require('./loaders/erb')
const { VueLoaderPlugin } = require('vue-loader')
const vue = require('./loaders/vue')

environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())
environment.loaders.prepend('vue', vue)
// environment.loaders.prepend('erb', erb)
const resolver = {
    resolve: {
        alias: {
            'vue$': 'vue/dist/vue.esm.js'
        }
    }
}
environment.config.merge(resolver)
module.exports = environment
