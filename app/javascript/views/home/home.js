import Vue from 'vue/dist/vue.esm'
import vueDebounce from 'vue-debounce'

// Views
import indexHome from './index/index.vue'
import showHome from './show/show.vue'

// Libs
Vue.use(vueDebounce)

document.addEventListener('DOMContentLoaded', () => {
    const vm = new Vue({
        el: '#home-vue',
        components: {
            'index-home': indexHome,
            'show-home': showHome,
        }
    })
})