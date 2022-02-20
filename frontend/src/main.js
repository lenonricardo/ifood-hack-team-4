import Vue from 'vue'
import App from './App.vue'
import router from './router'
import vuetify from './plugins/vuetify';

//axios
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.config.productionTip = false
Vue.use(VueAxios, axios)

axios.defaults.baseURL = "https://salty-thicket-33074.herokuapp.com/api/"

new Vue({
  router,
  vuetify,
  render: function (h) { return h(App) }
}).$mount('#app')
