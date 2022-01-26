import Vue from 'vue/dist/vue.esm'
import vueDebounce from 'vue-debounce'

// Views
import indexHome from './index/index.vue'

// Libs
Vue.use(vueDebounce)

document.addEventListener('DOMContentLoaded', () => {
    const vm = new Vue({
        el: '#home-vue',
        // store: dashboardStore,
        components: {
            'index-home': indexHome,
        }
    })
})