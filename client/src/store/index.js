import { createStore } from 'vuex'
import axios from '../service/axios'
const cookie = require('tiny-cookie')

export default createStore({
  state: {
    user: null,
    types: [],
    tags: [],
    articles: [],
  },
  getters: {
    getUser: state => {
      return state.user
    },
    getTypes: state => {
      return state.types
    },
  },
  mutations: {
    setUser(state, user) {
      console.log("set user mutation!")
      state.user = user
    },
    removeUser(state) {
      console.log("remove user mutation!")
      state.user = null
    },
    setTypes(state, types) {
      console.log("set types!")
      state.types = types
    }
  },
  actions: {
    logout(context) {
      cookie.remove('user')
      context.commit('removeUser')
    },
    getUserFromCookie(context) {
      const user = cookie.get('user')
      console.log("user:", user)
      if( user ) {
        context.commit('setUser', JSON.parse(user))
      }
    },
    // autoLogin(context) {
    //   const email = cookie.get('email')
    //   const authentication_token = cookie.get('authentication_token')
    //   console.log("Auto login")
    //   console.log("email:", email)
    //   console.log("authentication_token:", authentication_token)
    //   if( email && authentication_token ) {
    //     context.dispatch('login', { email, authentication_token } )
    //   }
    // },
    login(context, credentials) {
      console.log("login!")
      const { email, password } = credentials
      axios({
          method: 'post',
          url: '/sign_in',
          data: {
            sign_in: {
              email, password
            }
          },
      })
      .then(res => {
        console.log("login status:", res.data.is_success)
        if( res.data.is_success ) {
          const { user } = res.data.data
          context.commit('setUser', user)
          cookie.set('user', JSON.stringify(user))
          // cookie.set('email', user.email)
          // cookie.set('authentication_token', user.authentication_token)
        }
      })
    },
    getTypes(context) {
        console.log("Get types!")
        axios({
            method: 'get',
            url: '/types',
            headers: {
              'X-User-Email': context.state.user.email,
              'X-User-Token': context.state.user.authentication_token,
            }
        })
        .then(res => {
          console.log(res.data)
          context.commit('setTypes', res.data)
        })
    },
  },
  modules: {
  }
})
