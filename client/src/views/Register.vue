<template lang="html">
  <div>
    <h1>Register</h1>
    <form @submit="submitForm" class="form">
      <div class="form__input-group">
        <label for="email">Email:</label>
        <input type="email" v-model="user.email" id="email">
      </div>
      <div class="form__input-group">
        <label for="password">Password:</label>
        <input type="password" v-model="user.password" id="password">
      </div>
      <div class="form__input-group">
        <label for="password-confirmation">Password confirm:</label>
        <input type="password" v-model="user.password_confirmation" id="password-confirmation">
      </div>
      <div class="form__input-group">
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
