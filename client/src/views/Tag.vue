<template>
  <div class="view">

    <div v-if="getTag.id">
      <h1># {{ getTag.title }}</h1>

      <p>{{ getTag.body }}</p>

      <hr>

      <section v-if="getTag.articles.length">
        <p>Articles:</p>

        <div class="list-vertical">
          <div v-for="article in getTag.articles" :key="article.id" class="list-vertical__item">
            <router-link :to="{ name: 'Article', params: {id: article.id} }" :class="{hidden: article.hidden}">
              <span v-if="article.hidden">[secret]</span>
              {{ article.title }}
              <span class="right">{{ article.user.username }}</span>
            </router-link>
          </div>
        </div>
      </section>
      <section v-else>
        <p>There are not articles yet</p>
      </section>
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
    getTag() {
      return this.$store.getters.getTag
    },
  },
  mounted() {
    console.log("Tag.vue mounted")
    this.$store.dispatch('getTag', this.currentId)
  }
}
</script>

<style lang="scss">
</style>
