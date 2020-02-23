import Vue from 'vue'
import VueApollo from 'vue-apollo'
import ApolloClient from 'apollo-boost'
import VueRouter from 'vue-router'
import App from './App.vue'

// Import components for the router:
import Clouds from './components/Clouds'
import Deployments from './components/Deployments'
import Environment from './components/Environment'

Vue.use(VueRouter)

const routes = [
  { path: '', component: Deployments },
  { path: '/clouds', component: Clouds },
  { path: '/deployments', component: Deployments },
  { path: '/environments/:id', component: Environment },
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
