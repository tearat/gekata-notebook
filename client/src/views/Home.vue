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
      <p class="title-text">
        store: {{ storeTest }}
      </p>
      <p>
        env: {{ envTest }}
      </p>
    </div>
  </div>
</template>

<script>

import logo from '../assets/logo.png'

export default {
  name: 'Home',
  // components: {
  //   Index
  // },
  data() {
      return {
          logo: logo,
      }
  },
  computed: {
    envTest() {
      return process.env.BACK_PORT
    },
    storeTest() {
      return this.$store.state.test
    },
  },
  mounted() {
    // console.log("Mounted!")
    // console.log("VUE_APP_NOT_SECRET_CODE:", process.env.VUE_APP_NOT_SECRET_CODE)
  }
}
</script>

<style lang="scss">

.logo {
  padding: 20px;
  margin-top: 20px;
  .logo-img {
    width: 200px;
  }
}

.title {
  .title-header {
    font-size: 60px;
    font-weight: 300;
  }
  .title-text {
    font-size: 20px;
  }
}

</style>
