<template>
  <div class="view">
    <div v-if="getData.loaded && getArticle">

      <p class="gold" v-if="getArticle.hidden">Your secret article</p>
      <h1 :class="{gold: getArticle.hidden}">{{ getArticle.title }}</h1>

      <code>{{ getArticle.body }}</code>

      <hr>

      <p>
        Author:
        <router-link :to="{ name: 'Tag', params: {id: getTag.id} }">
          {{ getArticle.user.username }}
        </router-link>
      </p>

      <p>
        Tag:
        <router-link :to="{ name: 'Tag', params: {id: getTag.id} }">
          {{ getTag.title }}
        </router-link>
      </p>

      <p>
        Notebook:
        <router-link :to="{ name: 'Type', params: {id: getType.id} }">
          {{ getType.title }}
        </router-link>
      </p>


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
    getArticle() {
      return this.getData.articles.find(tag => tag.id == this.currentId)
    },
    getTag() {
      return this.getData.tags.find(tag => tag.id == this.getArticle.tag_id)
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
