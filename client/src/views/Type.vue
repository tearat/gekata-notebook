<template>
  <div class="view">
    <div v-if="getData.loaded && getType">

      <h1>{{ getType.title }}</h1>

      <p>{{ getType.body }}</p>

      <hr>

      <p>Tags:</p>

      <div class="list">
        <div v-for="tag in getTypeTags" :key="tag.id" class="list__item">
          <router-link :to="{ name: 'Tag', params: {id: tag.id} }" :class="{empty: tagArticlesCount(tag.id) == 0}">
            # {{ tag.title }} ({{  tagArticlesCount(tag.id) }})
          </router-link>
        </div>
      </div>

    </div>
    <div v-else>
      Not found
    </div>
  </div>
</template>

<script>

export default {
  name: 'Type',
  components: {
  },
  data() {
      return {
      }
  },
  computed: {
    currentId() {
      return this.$route.params.id
    },
    getData() {
      return this.$store.getters.getData
    },
    getType() {
      return this.getData.types.find(type => type.id == this.currentId)
    },
    getTypeTags() {
      return this.$store.getters.getData.tags.filter(tag => tag.type_id == this.getType.id)
    },
  },
  methods: {
    tagArticlesCount(tag_id) {
      return this.$store.getters.getData.articles.filter(article => article.tag_id == tag_id).length
    }
  },
  mounted() {
    // this.$store.dispatch('getTypes')
  }
}
</script>

<style lang="scss">

</style>
