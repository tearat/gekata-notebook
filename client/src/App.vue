<template>
  <div id="page" class="debug1">
    <div id="nav">
      <router-link to="/">Main</router-link>
      <router-link to="/types">Types</router-link>
      <router-link to="/tags">Tags</router-link>
      <router-link to="/articles">Articles</router-link>
    </div>
    <div>
      <router-view/>
    </div>
  </div>
</template>

<script>


export default {
  name: 'Home',
  data() {
      return {
      }
  },
  mounted() {
    // this.$store.actions.getdata()
    this.$store.dispatch('getData')
  }
}
</script>

<style lang="scss">

body {
  color: #eee;
  // background: #111;
  background: url('./assets/bg.jpg');
}

#page {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  background: #ffffff05;
  max-width: 1200px;
  margin: 40px auto;
  padding: 20px;
}

#nav {
  padding: 20px;
  border-bottom: 1px solid gold;
  a {
    font-weight: bold;
    color: gold;
    padding: 10px 20px;
    font-size: 24px;
    font-weight: 300;
    // margin: 10px;
    text-decoration: none;
    &:hover {
      background: #fff1;
    }
  }
}

.debug {
  div {
    border: 1px dashed royalblue;
  }
  h1,h2,h3,h4 {
    border: 1px dashed firebrick;
  }
  p {
    border: 1px dashed green;
  }
  span {
    border: 1px dashed purple;
  }
  a {
    background: yellow;
  }
}

.container {

}

</style>
