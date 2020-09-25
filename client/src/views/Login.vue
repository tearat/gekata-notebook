<template lang="html">
  <div>
    <h1>Login</h1>
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
        <button type="submit">Login</button>
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
            email: '',
            password: '',
          },
      }
  },
  computed: {
  },
  methods: {
    submitForm(event) {
      event.preventDefault()
      console.log("Login form sent")
      this.$store.dispatch('login', this.user)
      this.$router.push({name: 'Home'})
    }
  },
  mounted() {
  }
}
</script>

<style lang="scss">
</style>
