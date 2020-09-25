<template>
  <div class="view">

    <router-link :to="{ name: 'NewArticle' }" class="button">New article</router-link>

    <div v-if="getYourArticles.length || getOtherArticles.length">

      <section v-if="getYourArticles.length">
        <h1>Your articles:</h1>
        <div class="list-vertical">
          <div v-for="article in getYourArticles" :key="article.id" class="list-vertical__item">
            <router-link :to="{ name: 'Article', params: {id: article.id} }" :class="{hidden: article.hidden}">
              <span v-if="article.hidden">[secret]</span>
              {{ article.title }}
              <span class="right">{{ article.user.username }}</span>
            </router-link>
          </div>
        </div>
      </section>

      <section v-if="getOtherArticles.length" >
        <h1 v-if="getYourArticles.length">Other articles:</h1>
        <h1 v-else>Articles:</h1>
        <div class="list-vertical">
          <div v-for="article in getOtherArticles" :key="article.id" class="list-vertical__item">
            <router-link :to="{ name: 'Article', params: {id: article.id} }" :class="{hidden: article.hidden}">
              <span v-if="article.hidden">[secret]</span>
              {{ article.title }}
              <span class="right">{{ article.user.username }}</span>
            </router-link>
          </div>
        </div>
      </section>

    </div>

    <div v-else>
      <p>There are not articles yet</p>
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
    getUser() {
      return this.$store.getters.getUser
    },
    getYourArticles() {
      return this.$store.getters.getArticles.filter(article => article.user_id == this.getUser.id)
    },
    getOtherArticles() {
      return this.$store.getters.getArticles.filter(article => article.user_id != this.getUser.id)
    },
  },
  mounted() {
  }
}
</script>

<style lang="scss">
</style>
