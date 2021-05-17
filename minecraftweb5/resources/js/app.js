
require('./bootstrap');

window.Vue = require('vue').default;
import Vuex from 'vuex'
import storeVuex from './store/index'
import VueChatScroll from 'vue-chat-scroll'
import Vue from 'vue';

Vue.use(VueChatScroll)
Vue.use(Vuex)
const store = new Vuex.Store(storeVuex)
const VueUploadComponent= require('vue-upload-component')
Vue.component('file-upload', VueUploadComponent)
Vue.component('main-app', require('./components/MainApp.vue').default);




const app = new Vue({
    el: '#app',
    store
});
