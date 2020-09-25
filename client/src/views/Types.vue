<template>
  <div class="view">

    <h1>All notebooks:</h1>

    <div v-if="getTypes.length" class="list">
      <div v-for="type in getTypes" :key="type.id" class="list__item">
        <router-link :to="{ name: 'Type', params: {id: type.id} }">
          {{ type.title }}
        </router-link>
      </div>
    </div>

    <div v-else>
      <p>Loading error</p>
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
      return this.$store.getters.getTypes
    },
  },
  mounted() {
  }
}
</script>

<style lang="scss">
</style>
