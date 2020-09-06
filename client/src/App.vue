<template>
  <div id="page" class="debug1">
    <div id="nav">
      <!-- <p>types: {{ $store.state.types.length }}</p> -->
      <!-- <p>tags: {{ $store.state.tags.length }}</p> -->
      <!-- <p>articles: {{ $store.state.articles.length }}</p> -->
      <!-- <p>store user: {{ $store.state.user }}</p> -->
      <!-- <p>cookie user: {{ userCookie }}</p> -->

      <router-link to="/">Main</router-link>

      <span v-if="isAuth">
        <router-link to="/types">Types</router-link>
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
      this.$store.dispatch('logout')
      this.$router.push('/')
    }
  },
  mounted() {
    this.$store.dispatch('getUserFromCookie')
    // this.$store.dispatch('autoLogin')
  }
}
</script>

<style lang="scss">

body {
  color: #eee;
  // background: #111;
  background: url('./assets/bg.jpg');
}

#page {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background: #ffffff05;
  max-width: 1200px;
  margin: 40px auto;
  padding: 20px;
}

#nav {
  padding: 20px;
  border-bottom: 1px solid gold;
  a {
    font-weight: bold;
    color: gold;
    padding: 10px 20px;
    font-size: 24px;
    font-weight: 300;
    // margin: 10px;
    text-decoration: none;
    &:hover {
      background: #fff1;
    }
  }
}

.debug {
  div {
    border: 1px dashed royalblue;
  }
  h1,h2,h3,h4 {
    border: 1px dashed firebrick;
  }
  p {
    border: 1px dashed green;
  }
  span {
    border: 1px dashed purple;
  }
  a {
    background: yellow;
  }
}

.container {

}

</style>
