import { createRouter, createWebHistory } from 'vue-router'
import Home from '../views/Home.vue'

const routes = [
  { path: '/', name: 'Home', meta: { title: "Gekata: Home" }, component: Home },
  { path: '/login', name: 'Login', meta: { title: "Gekata: Login" }, component: () => import('../views/Login.vue') },
  { path: '/register', name: 'Register', meta: { title: "Gekata: Register" }, component: () => import('../views/Register.vue') },
  { path: '/notebooks', name: 'Types', meta: { title: "Gekata: Types" }, component: () => import('../views/Types.vue') },
  { path: '/notebooks/:id', name: 'Type', component: () => import('../views/Type.vue') },
  { path: '/tags', name: 'Tags', meta: { title: "Gekata: Tags" }, component: () => import('../views/Tags.vue') },
  { path: '/tags/:id', name: 'Tag', component: () => import('../views/Tag.vue') },
  { path: '/articles', name: 'Articles', meta: { title: "Gekata: Articles" }, component: () => import('../views/Articles.vue') },
  { path: '/articles/:id', name: 'Article', component: () => import('../views/Article.vue') },
  { path: '/articles/new', name: 'NewArticle', component: () => import('../views/NewArticle.vue') },
  // route level code-splitting
  // this generates a separate chunk (about.[hash].js) for this route
  // which is lazy-loaded when the route is visited.
  { path: '/about', name: 'About', component: () => import(/* webpackChunkName: "about" */ '../views/About.vue') },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to, from, next) => {
  const nearestWithTitle = to.matched.find(r => r.meta && r.meta.title)
  if (nearestWithTitle) document.title = nearestWithTitle.meta.title
  next()
})

export default router
