<template>
  <div class="view">

    <h1>All tags</h1>

    <div v-if="getTags" class="list">
      <!-- v-if="isTagHasArticles(tag.id)" -->
      <div v-for="tag in getTags" :key="tag.id" class="list__item">
        <router-link :to="{ name: 'Tag', params: {id: tag.id} }" :class="{empty: tagArticlesCount(tag.id) == 0}">
          # {{ tag.title }} ({{  tagArticlesCount(tag.id) }})
        </router-link>
      </div>
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
      return this.$store.getters.getData.tags
    },
  },
  methods: {
    tagArticlesCount(tag_id) {
      return this.$store.getters.getData.articles.filter(article => article.tag_id == tag_id).length
    }
  },
  mounted() {
    // this.$store.dispatch('getTags')
  }
}
</script>

<style lang="scss">

</style>
