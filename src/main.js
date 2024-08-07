import Vue from 'vue'
import App from './App.vue'

import VueRouter from 'vue-router'
import router from './router/index.js'
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
// storage 封装
import storage from "@/utils/storage";
Vue.config.productionTip = false

Vue.use(VueRouter)
Vue.use(ElementUI);
Vue.prototype.$storage = storage
new Vue({
  render: h => h(App),
  router
}).$mount('#app')
