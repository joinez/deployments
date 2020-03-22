<template>
  <ul class="environment">
    <h2>{{ environment.cloud.name }}/{{ environment.name }}</h2>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <li v-for="s in environment.services" :key="s.id">
        <p>
          {{ s.name }}
        </p>
        <ul>
          <li v-for="cv in s.currentVersions" :key="cv.id">
            <p>{{ cv.version }}</p>
          </li>
        </ul>
      </li>
    </div>
  </ul>
</template>

<script>
import { getEnvironment } from '../queries'

export default {
  data: function() {
    return {
      environment: {},
      routeParam: this.$route.params.id
    };
  },
  apollo: {
    environment: {
      query: getEnvironment,
      pollInterval: 10000,
      variables() {
        return {
          id: this.routeParam
        }
      }
    },
  }
}
</script>

<style>
.environment {
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
</style>
