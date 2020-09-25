<template>
  <div class="view">

    <h1>All tags</h1>

    <div v-if="getTags.length" class="list">
      <div v-for="tag in getTags" :key="tag.id" class="list__item">
        <router-link :to="{ name: 'Tag', params: {id: tag.id} }" :class="{empty: !tag.articles_count}">
          # {{ tag.title }} ({{ tag.articles_count }})
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
  name: 'Home',
  components: {
  },
  data() {
      return {
      }
  },
  computed: {
    getTags() {
      return this.$store.getters.getTags
    },
  },
  mounted() {
  }
}
</script>

<style lang="scss">
</style>
