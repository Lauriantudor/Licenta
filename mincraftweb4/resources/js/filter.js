window.Vue = require('vue').default;
import moment from 'moment';
import Vue from 'vue';




Vue.filter('timeformat', function(arg){
    return moment(arg).format('MMMM Do YYYY, h:mm:ss a')
});