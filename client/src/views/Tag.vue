<template>
  <div class="view">
    <div v-if="getData.loaded && getTag">

      <h1># {{ getTag.title }}</h1>

      <p>{{ getTag.body }}</p>

      <p>
        Notebook:
        <router-link :to="{ name: 'Type', params: {id: getTag.type_id} }">
          {{ getType.title }}
        </router-link>
      </p>

      <hr>

      <p>Articles:</p>

      <div class="list-vertical">
        <div v-for="article in getTagArticles" :key="article.id" class="list-vertical__item">
          <router-link :to="{ name: 'Article', params: {id: article.id} }">
            {{ article.title }}
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
    getTag() {
      return this.getData.tags.find(tag => tag.id == this.currentId)
    },
    getType() {
      return this.getData.types.find(type => type.id == this.getTag.type_id)
    },
    getTagArticles() {
      return this.$store.getters.getData.articles.filter(article => article.tag_id == this.getTag.id)
    },
  },
  mounted() {
    // this.$store.dispatch('getTypes')
  }
}
</script>

<style lang="scss">

</style>
