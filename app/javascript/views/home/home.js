import Vue from 'vue/dist/vue.esm'
import vueDebounce from 'vue-debounce'
import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'

// Views
import indexHome from './index/index.vue'
import showHome from './show/show.vue'

// Libs
Vue.use(vueDebounce)
Vue.use(Vuetify)

const vuetify = new Vuetify({
    theme: {
        themes: {
            light: {
                primary: '#4060D6',
                secondary: '#B14AF7',
            },
        },
    },
})

document.addEventListener('DOMContentLoaded', () => {
    const vm = new Vue({
        el: '#home-vue',
        vuetify: vuetify,
        components: {
            'index-home': indexHome,
            'show-home': showHome,
        }
    })
})