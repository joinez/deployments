<template>
  <ul id="deployments">
    <h2>Deployments</h2>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <li v-for="d in deployments" :key="d.id">
        <p class="deployment">
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
      </li>
    </div>
  </ul>
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
}
</script>

<style>
#deployments {
  background-color: #27293d;
  color: #fff;
  border-radius: 5px;
  padding-top: 1px;
  padding-bottom: 1px;
  margin-top: 90px;
  margin-left: 12px;
  margin-right: 12px;
  list-style: none;
}
.deployment > a {
  color: #42b883;
}
#current-versions {
  list-style: none;
}
</style>
