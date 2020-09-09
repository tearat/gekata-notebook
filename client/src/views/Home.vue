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
      <p class="title-text" v-if="getUser">
        Hello, <span class="accent">{{ getUser.username }}</span>
      </p>
      <p v-else>
        Hello, stranger...
      </p>
    </div>
  </div>
</template>

<script>

import logo from '../assets/images/logo.png'

export default {
  name: 'Home',
  components: {
  },
  data() {
      return {
          logo,
      }
  },
  computed: {
    envTest() {
      return `${process.env.VUE_APP_API_HOST} : ${process.env.VUE_APP_API_PORT}`
    },
    getUser() {
      return this.$store.getters.getUser
    },
  },
  mounted() {
  }
}
</script>

<style lang="scss">

$accent: #d181ff;

.accent {
  color: $accent;
}

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
    font-weight: 100;
  }
  .title-text {
    font-size: 20px;
  }
}

</style>
