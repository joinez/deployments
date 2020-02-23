<template>
  <ul class="environment">
    <h2>{{ environment.name }} {{ $route.params.id }}</h2>
    <div v-if="$apollo.loading">Loading..</div>
  </ul>
</template>

<script>
import { gql } from 'apollo-boost'

export default {
  data: function() {
    return {
      environment: {},
    };
  },
  apollo: {
    environment: {
      query: gql`
      {
        environment(id: 1) {
          name
        }
      }`
    }
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
