import Vue from 'vue'
//import App from './App.vue' 
import App from './AppButton.vue' 
//import App from './AppAlert.vue' 

import BootstrapVue from 'bootstrap-vue'
//import { LayoutPlugin } from 'bootstrap-vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'
Vue.use(BootstrapVue)

//Vue.use(LayoutPlugin)

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
}).$mount('#app')
