<template lang="html">
  <div>
    <h1>Register</h1>
    <form @submit="submitForm">
      <div>
        <label for="email">email:</label>
        <input type="email" v-model="user.email" id="email">
      </div>
      <div>
        <label for="password">password:</label>
        <input type="password" v-model="user.password" id="password">
      </div>
      <div>
        <label for="password-confirmation">passwordConfirm:</label>
        <input type="password" v-model="user.password_confirmation" id="password-confirmation">
      </div>
      <div>
        <button type="submit">Register</button>
      </div>
    </form>
  </div>
</template>

<script>

import axios from '../service/axios.js'

export default {
  name: 'Register',
  components: {
    // Register: () => require('../components/Register.vue'),
  },
  data() {
      return {
          user: {
            email: '',
            password: '',
            password_confirmation: '',
          },
      }
  },
  computed: {
  },
  methods: {
    submitForm(event) {
      event.preventDefault()
      console.log("Register form sent")
      axios({
          method: 'post',
          url: '/sign_up',
          data: {
            user: this.user
          },
      })
      .then(res => {
        console.log(res.data)
      })
    }
  },
  mounted() {
    // console.log("Mounted!")
    // console.log("VUE_APP_NOT_SECRET_CODE:", process.env.VUE_APP_NOT_SECRET_CODE)
  }
}
</script>

<style lang="css" scoped>
</style>
