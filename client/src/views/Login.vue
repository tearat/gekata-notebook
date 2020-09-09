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

// import axios from '../service/axios.js'

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
      // axios({
      //     method: 'post',
      //     url: '/sign_up',
      //     data: {
      //       credentials: this.user
      //     },
      // })
      // .then(res => {
      //   console.log(res.data)
      // })
    }
  },
  mounted() {
    // console.log("Mounted!")
    // console.log("VUE_APP_NOT_SECRET_CODE:", process.env.VUE_APP_NOT_SECRET_CODE)
  }
}
</script>

<style lang="scss">

.form {
  // background: red;
  padding: 20px;
  max-width: 200px;
  margin: 0 auto;
  &__input-group {
    margin-bottom: 10px;
    label {
      display: block;
    }
    input {
      border: none;
      padding: 10px;
      background: #fff2;
      color: white;
      width: calc(100% - 20px);
      &:focus {
        outline: none;
      }
    }
    button {
      margin-top: 20px;
      width: 100%;
      border: none;
      padding: 10px;
      background: #fff2;
      color: white;
      &:hover {
        background: #fff4;
        cursor: pointer;
      }
    }
  }
}

</style>
