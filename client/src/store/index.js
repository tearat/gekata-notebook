import { createStore } from 'vuex'
import axios from '../service/axios'

export default createStore({
  state: {
    test: "I am store!"
  },
  mutations: {
    getData(state) {
        console.log("addPin mutation")
        console.log("state:", state)
    },
  },
  actions: {
    getData() {
        console.log("Get data!")
        console.log("context:")
        axios({
            method: 'get',
            url: '/articles',
            headers: {
              'X-User-Email': 'abcd@example.com',
              'X-User-Token': 'CJRu7_3Jwb_zJc3QKTq7',
            }
        })
        // axios.get('/articles')
        .then(res => {
          console.log(res.data)
        })
    },
  },
  modules: {
  }
})
