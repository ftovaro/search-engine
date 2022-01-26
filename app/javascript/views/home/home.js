import Vue from 'vue/dist/vue.esm'

// Views
import indexHome from './index/index.vue'

document.addEventListener('DOMContentLoaded', () => {
    const vm = new Vue({
        el: '#home-vue',
        // store: dashboardStore,
        components: {
            'index-home': indexHome,
        }
    })
})