<template>
  <ul class="deployments">
    <h2>Deployments</h2>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <li v-for="d in deployments" :key="d.id">
        <p>
          #{{ d.id }}
          <a :href="'#/environments/' + d.environment.id">{{ d.environment.cloud.name }}/{{ d.environment.name }}</a>
          ({{ d.success ? 'successful' : 'failed' }} -
          took {{ d.duration }} seconds)
          <a :href="d.buildUrl" target="_blank">open build</a>
        </p>
        <ul>
          <li v-for="dv in d.deploymentVersions" :key="dv.id">
            <p>{{ dv.service.name }} - {{ dv.version }}</p>
          </li>
        </ul>
      </li>
    </div>
  </ul>
</template>

<script>
import { getDeployments } from '../queries'

export default {
  data: function() {
    return {
      deployments: {}
    };
  },
  apollo: {
    deployments: {
      query: getDeployments,
      pollInterval: 10000
    }
  }
}
</script>

<style>
.deployments {
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
a {
  color: #42b883;
}
</style>
