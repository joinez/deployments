<template>
  <div id="app">
    <h1>Deployments</h1>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <ul id="deployments">
        <li v-for="d in deployments" :key="d.id">
          <p>
            <a :href="d.buildUrl" target="_blank">#{{ d.id }}</a>
            {{ d.environment.cloud.name }}
            {{ d.environment.name }}
            ({{ d.success ? 'successful' : 'failed' }} -
            took {{ d.duration }} seconds)
          </p>
          <ul id="current-versions">
            <li v-for="cv in d.currentVersions" :key="cv.id">
              <p>{{ cv.service.name }} - {{ cv.version }}</p>
            </li>
          </ul>
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
          success
          duration
          buildUrl
          environment {
            name
            cloud {
              name
            }
          }
          currentVersions {
            version
            service {
              name
            }
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
#current-versions {
  list-style-type: none;
}
</style>
