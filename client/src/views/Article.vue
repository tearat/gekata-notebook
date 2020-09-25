<template>
  <div class="view">

    <div v-if="getArticle.id">

      <p class="gold" v-if="getArticle.hidden">Your secret article</p>
      <h1 :class="{gold: getArticle.hidden}">{{ getArticle.title }}</h1>

      <p class="body">{{ getArticle.body }}</p>

      <hr>

      <p>
        Author:
        <router-link :to="{ name: 'Tag', params: {id: getArticle.user.id} }">
          {{ getArticle.user.username }}
        </router-link>
      </p>

      <p>
        Notebook:
        <router-link :to="{ name: 'Type', params: {id: getArticle.type.id} }">
          {{ getArticle.type.title }}
        </router-link>
      </p>

      <div>
        Tags:
        <div v-if="getArticle.tags.length" class="list">
          <div v-for="tag in getArticle.tags" :key="tag.id" class="list__item">
            <router-link :to="{ name: 'Tag', params: {id: tag.id} }">
              # {{ tag.title }}
            </router-link>
          </div>
        </div>
      </div>

    </div>

    <div v-else>
      Article not found
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
    getArticle() {
      return this.$store.getters.getArticle
    },
  },
  mounted() {
    this.$store.dispatch('getArticle', this.currentId)
  }
}
</script>

<style lang="scss" scoped>
</style>
