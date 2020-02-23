<template>
  <ul id="clouds">
    <h2>Clouds</h2>
    <div v-if="$apollo.loading">Loading..</div>
    <div v-else>
      <li v-for="c in clouds" :key="c.id">
        <p class="cloud">
          {{ c.name }}
        </p>
        <ul>
          <li v-for="e in c.environments" :key="e.id">
            <p>{{ e.name }}</p>
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
      clouds: {}
    };
  },
  apollo: {
    clouds: {
      query: gql`
      {
        clouds {
          id
          name
          environments {
            id
            name
          }
        }
      }`
    }
  }
}
</script>

<style>
#clouds {
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
