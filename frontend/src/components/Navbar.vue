<template>
  <div id="navbar">
    <nav class="navbar">
      <ul class="nav-items">
        <li class="nav-item">
          <a href="/deployments">
            Deployments
          </a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
export default{
}
</script>

<style>
.navbar {
  background: linear-gradient(to right,#42b883,#389466);
  height: 50px;
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  margin: 20px;
  border-radius: 5px;
}
.nav-items {
  list-style: none;
}
.nav-item > a {
  color: #fff;
}
</style>
