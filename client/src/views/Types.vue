<template>
  <div>
    <div v-if="getTypes.length">
      <div v-for="type in getTypes" :key="type.id">
        <h2>{{ type.title }}</h2>
        <p>{{ type.body }}</p>
      </div>
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
    getTypes() {
      return this.$store.getters.getTypes
    },
  },
  mounted() {
    this.$store.dispatch('getTypes')
  }
}
</script>

<style lang="scss">

</style>
