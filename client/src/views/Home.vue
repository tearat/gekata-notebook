<template>
  <div>
    <div  class="logo">
      <img class="logo-img" :src="logo" alt="">
    </div>
    <div class="title">
      <h1 class="title-header">Gekata</h1>
      <p class="title-text">
        Awesome notebook!
      </p>
      <p class="title-text" v-if="isAuth">
        Hello, {{ isAuth.email }}
      </p>
      <p v-else>
        Hello, stranger...
      </p>
    </div>
  </div>
</template>

<script>

import logo from '../assets/logo.png'

export default {
  name: 'Home',
  components: {
  },
  data() {
      return {
          logo: logo,
      }
  },
  computed: {
    envTest() {
      return `${process.env.VUE_APP_API_HOST} : ${process.env.VUE_APP_API_PORT}`
    },
    isAuth() {
      return this.$store.getters.getUser
    },
  },
  mounted() {
  }
}
</script>

<style lang="scss">

.logo {
  padding: 10px;
  margin-top: 20px;
  .logo-img {
    width: 200px;
  }
}

.title {
  .title-header {
    font-size: 40px;
    font-weight: 300;
  }
  .title-text {
    font-size: 20px;
  }
}

</style>
