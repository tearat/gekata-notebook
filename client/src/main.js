import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import cookie from './plugins/cookie'
require('./assets/style/main.scss')

const path = require('path')
require('dotenv').config( { path: path.resolve(__dirname, '.env') } )

createApp(App)
.use(cookie)
.use(store)
.use(router)
.mount('#app')
