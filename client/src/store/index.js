import { createStore } from 'vuex'
import axios from '../service/axios'
const cookie = require('tiny-cookie')

export default createStore({
  state: {
    user: null,
     // lazyload, static
    types: [],
    tags: [],
    articles: [],
     // mutable
    type: {},
    tag: {},
    article: {},
  },
  getters: {
    getUser:     state => state.user,
    getTypes:    state => state.types,
    getType:     state => state.type,
    getTags:     state => state.tags,
    getTag:      state => state.tag,
    getArticles: state => state.articles,
    getArticle:  state => state.article,
  },
  mutations: {
    setUser(state, user) {
      console.log("Mutation: setUser")
      state.user = user
    },
    removeUser(state) {
      console.log("Mutation: removeUser")
      state.user = null
    },
    setTypes(state, types) { // DONE
      console.log("Mutation: setTypes")
      state.types = types
    },
    setType(state, type) { // DONE
      console.log("Mutation: setType")
      state.type = type
    },
    setTags(state, tags) { // DONE
      console.log(`Mutation: setTags (count ${tags.length})`)
      state.tags = tags
    },
    setTag(state, tag) { // DONE
      console.log(`Mutation: setTag (tag: ${tag})`)
      state.tag = tag
    },
    setArticles(state, articles) {
      console.log("Mutation: setArticles")
      state.articles = articles
    },
    setArticle(state, article) {
      console.log(`Mutation: setArticle (article: ${article})`)
      state.article = article
    },
  },
  actions: {
    logout(context) {
      console.log("Action: logout")
      cookie.remove('user')
      context.commit('removeUser')
      context.commit('clearData')
    },
    getUserFromCookie(context) {
      console.log("Action: getUserFromCookie")
      const user = cookie.get('user')
      console.log("user:", user)
      if( user ) {
        context.commit('setUser', JSON.parse(user))
        // lazyload
        context.dispatch('getTypes')
        context.dispatch('getTags')
        context.dispatch('getArticles')
      }
    },
    login(context, credentials) {
      console.log("Action: login")
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
    register(context, credentials) {
      console.log("Action: register")
      axios({
          method: 'post',
          url: '/sign_up',
          data: {
            user: credentials
          },
      })
      .then(res => {
        console.log("Register success")
        console.log(res.data)
      })
    },
    getTypes(context) {
      context.dispatch('dataLoader', ['types', 'setTypes'])
    },
    getType(context, typeId) {
      context.dispatch('dataLoader', [`types/${typeId}`, 'setType'])
    },
    getTags(context) {
      context.dispatch('dataLoader', ['tags', 'setTags'])
    },
    getTag(context, tagId) {
      context.dispatch('dataLoader', [`tags/${tagId}`, 'setTag'])
    },
    getArticles(context) {
      context.dispatch('dataLoader', ['articles', 'setArticles'])
    },
    getArticle(context, articleId) {
      context.dispatch('dataLoader', [`articles/${articleId}`, 'setArticle'])
    },
    dataLoader(context, params) {
      // Получает URL для апи, по которому будет загружена дата
      // Получает название мутации, которая будет выполнена после загрузки
      const [ url, mutation ] = params
      console.log(`Action: dataLoader: ${url}, ${mutation}`)
      axios({
          method: 'get',
          url: `/${url}`,
          headers: {
            'X-User-Email': context.state.user.email,
            'X-User-Token': context.state.user.authentication_token,
          }
      })
      .then(res => {
        console.log(res.data)
        context.commit(mutation, res.data)
      })
      .catch(() => {
        console.error("Data not loaded")
        // context.dispatch('logout')
      })
    }
  },
  modules: {
  }
})
