<template>
  <div class="view">
    <div v-if="getData.loaded">

      <h1>Your articles:</h1>

      <div v-if="getYourArticles" class="list-vertical">
        <div v-for="article in getYourArticles" :key="article.id" class="list-vertical__item">
          <router-link :to="{ name: 'Article', params: {id: article.id} }" :class="{hidden: article.hidden}">
            <span v-if="article.hidden">[secret]</span>
            {{ article.title }}
            <span class="right">{{ article.user.username }}</span>
          </router-link>
        </div>
      </div>

      <h1>Other articles:</h1>

      <div v-if="getOtherArticles" class="list-vertical">
        <div v-for="article in getOtherArticles" :key="article.id" class="list-vertical__item">
          <router-link :to="{ name: 'Article', params: {id: article.id} }" :class="{hidden: article.hidden}">
            <span v-if="article.hidden">[secret]</span>
            {{ article.title }}
            <span class="right">{{ article.user.username }}</span>
          </router-link>
        </div>
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
    getData() {
      return this.$store.getters.getData
    },
    getUser() {
      return this.$store.getters.getUser
    },
    getYourArticles() {
      return this.$store.getters.getData.articles.filter(article => article.user_id == this.getUser.id)
    },
    getOtherArticles() {
      return this.$store.getters.getData.articles.filter(article => article.user_id != this.getUser.id)
    },
  },
  mounted() {
    // this.$store.dispatch('getArticles')
  }
}
</script>

<style lang="scss">

</style>
