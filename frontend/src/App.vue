<template>
  <div id="app">
    <navbar></navbar>
    <deployments></deployments>
  </div>
</template>

<script>
import Navbar from './components/Navbar'
import Deployments from './components/Deployments'

export default {
  components: {
    'navbar': Navbar,
    'deployments': Deployments
  }
};
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
</style>
