<template lang="html">
  <div>
    <h1>New article</h1>

    <form @submit="submitForm" class="form">

      <div class="form__input-group">
        <label for="title">Title:</label>
        <input type="text" v-model="article.title" id="title">
      </div>

      <div class="form__input-group">
        <label for="body">Body:</label>
        <textarea v-model="article.body" id="body"></textarea>
      </div>

      <div class="form__input-group">
        <label for="type_id">Notebook:</label>
        <select id="type_id" v-model="article.type_id">
          <option v-for="type in getTypes" :key="type.id" :value="type.id">{{ type.title }}</option>
        </select>
      </div>

      <div class="form__input-group">
        <label for="hidden">Visibility:</label>
        <select id="hidden" v-model="article.hidden">
          <option value="0">Public</option>
          <option value="1">Secret</option>
        </select>
      </div>

      <div class="form__input-group">
        <button type="submit">Create</button>
      </div>

    </form>

  </div>
</template>

<script>

import axios from '../service/axios.js'

export default {
  name: 'NewArticle',
  components: {
  },
  data() {
      return {
          article: {
            title: '',
            body: '',
            type_id: null,
            tags: [],
            hidden: 0,
          },
      }
  },
  computed: {
    getUser() {
      return this.$store.getters.getUser
    },
    getTypes() {
      return this.$store.getters.getTypes
    },
  },
  methods: {
    submitForm(event) {
      event.preventDefault()
      console.log("Login form sent")
      console.log(this.getUser)
      const { title, body, tags, type_id, hidden } = this.article
      const user_id = this.getUser.id
      axios({
          method: 'post',
          url: '/articles',
          data: {
            title, body, tags, type_id, hidden, user_id
          },
          headers: {
            'X-User-Email': this.getUser.email,
            'X-User-Token': this.getUser.authentication_token,
          }
      })
      .then(res => {
        this.$store.dispatch('getArticles')
        console.log(res.data)
        this.$router.push({ name: 'Article', params: {id: res.data.id} })
      })
    }
  },
  mounted() {
  }
}
</script>

<style lang="scss">
</style>
