<template>
  <div class="view">

    <h1>All notebooks:</h1>

    <div v-if="getTypes" class="list">
      <div v-for="type in getTypes" :key="type.id" class="list__item">
        <router-link :to="{ name: 'Type', params: {id: type.id} }">
          {{ type.title }}
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Types',
  components: {
  },
  data() {
      return {
      }
  },
  computed: {
    getTypes() {
      return this.$store.getters.getData.types
    },
  },
  mounted() {
    // this.$store.dispatch('getTypes')
  }
}
</script>

<style lang="scss">




</style>
