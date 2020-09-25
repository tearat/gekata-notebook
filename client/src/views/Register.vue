<template lang="html">
  <div>
    <h1>Register</h1>
    <form @submit="submitForm" class="form">
      <div class="form__input-group">
        <label for="username">Username:</label>
        <input type="text" v-model="user.username" id="username">
      </div>
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

export default {
  name: 'Register',
  components: {
  },
  data() {
      return {
          user: {
            username: '',
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
      if( this.password != this.password_confirmation ) {
        console.log("Password not confirmed")
        return false
      }
      console.log("Register form sent")
      this.$store.dispatch('register', this.user)
      .then(() => {
        this.$store.dispatch('login', this.user)
        this.$router.push({name: 'Home'})
      })
    }
  },
  mounted() {
  }
}
</script>

<style lang="scss" scoped>
</style>
