import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
const path = require('path')
require('dotenv').config( { path: path.resolve(__dirname, '.env') } )

createApp(App).use(store).use(router).mount('#app')
