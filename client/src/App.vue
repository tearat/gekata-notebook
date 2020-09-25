<template>
  <div id="page" class="debug1">

    <div id="nav">
      <p>types: {{ $store.state.types.length }}</p>
      <p>tags: {{ $store.state.tags.length }}</p>
      <p>articles: {{ $store.state.articles.length }}</p>
      <p>data: {{ !!$store.state.data }}</p>
      <p>store user: {{ $store.state.user }}</p>
      <p>cookie user: {{ userCookie }}</p>

      <router-link to="/">
        Main
      </router-link>

      <span v-if="isAuth">
        <router-link to="/notebooks">Notebooks</router-link>
        <router-link to="/tags">Tags</router-link>
        <router-link to="/articles">Articles</router-link>
        <a href="#" @click="logout">Logout</a>
      </span>

      <span v-else>
        <router-link to="/login">Login</router-link>
        <router-link to="/register">Register</router-link>
      </span>

    </div>

    <div>
      <router-view/>
    </div>
  </div>
</template>

<script>

import cookie from 'tiny-cookie'

export default {
  name: 'Home',
  data() {
      return {
      }
  },
  components: {
  },
  computed: {
    isAuth() {
      return this.$store.getters.getUser
    },
    userCookie() {
      return cookie.get('user')
    }
  },
  methods: {
    logout() {
      if (confirm("Logout?")) {
        this.$store.dispatch('logout')
        this.$router.push('/')
      }
    }
  },
  mounted() {
    this.$store.dispatch('getUserFromCookie')
    // this.$store.dispatch('autoLogin')
  }
}
</script>

<style lang="scss">
</style>
