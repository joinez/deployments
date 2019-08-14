import Vue from 'vue'
import VueApollo from 'vue-apollo'
import ApolloClient from 'apollo-boost'
import VueRouter from 'vue-router'
import App from './App.vue'

// Import components for the router:
import Deployments from './components/Deployments'
import Clouds from './components/Clouds'

Vue.use(VueRouter)

const routes = [
  { path: '', component: Deployments },
  { path: '/deployments', component: Deployments },
  { path: '/clouds', component: Clouds }
]

const router = new VueRouter({
  routes
})

Vue.use(VueApollo);

//creating apollo client
const client = new ApolloClient({
  uri: 'http://' + (process.env.VUE_APP_HOST || 'localhost') + ':3000/graphql'
});

const apolloProvider = new VueApollo({
  defaultClient: client,
})

Vue.config.productionTip = false

new Vue({
  render: h => h(App),
  apolloProvider,
  router
}).$mount('#app')
