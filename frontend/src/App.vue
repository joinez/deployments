<template>
  <div id="app">
    <h1>Deployments</h1>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <ul id="deployments">
        <li v-for="deployment in deployments" :key="deployment.id">
          <p>#{{ deployment.id }} - {{ deployment.service.name }}</p>
          <p>{{ deployment.startedAt }} - {{ deployment.finishedAt }}</p>
          <hr>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { gql } from 'apollo-boost'

export default {
  data: function() {
    return {
      deployments: {}
    };
  },
  apollo: {
    deployments: {
      query: gql`
      {
        deployments {
          id
          startedAt
          finishedAt
          service {
            id
            name
          }
        }
      }`
    }
  }
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
#deployments {
  list-style-type: none;
  text-align: left;
}
</style>
