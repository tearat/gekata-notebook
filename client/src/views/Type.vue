<template>
  <div class="view">

    <div v-if="getType.id">

      <h1>{{ getType.title }}</h1>

      <p>{{ getType.body }}</p>

      <hr>

      <section v-if="getType.articles.length">
        <p>Articles:</p>

        <div class="list-vertical">
          <div v-for="article in getType.articles" :key="article.id" class="list-vertical__item">
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
      Type not found
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
    getType() {
      return this.$store.getters.getType
    },
  },
  mounted() {
    this.$store.dispatch('getType', this.currentId)
  }
}
</script>

<style lang="scss">
</style>
