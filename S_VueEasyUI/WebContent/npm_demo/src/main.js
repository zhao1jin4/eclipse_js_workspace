// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
//import App from './AppDataGrid' 
import App from './AppDataGridServer' 


import 'vx-easyui/dist/themes/default/easyui.css';
import 'vx-easyui/dist/themes/icon.css';
import 'vx-easyui/dist/themes/vue.css';
import EasyUI from 'vx-easyui';
Vue.use(EasyUI);
Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app', 
  components: { App },
  template: '<App/>'
})
