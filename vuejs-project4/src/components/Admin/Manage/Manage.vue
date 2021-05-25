<template>
    <div class="container">
        <router-view></router-view>
    </div>  
</template>

<script>
export default {
     data() {
        return {
             role : null
        }
    },
    async created() {
        this.role = localStorage.getItem('role');
    }
}
</script>

<style>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #525252;
  background: linear-gradient(to right, #414141ee, #1d1d1d);
}

.card {
  border: 0;
  border-radius: 0.5rem;
  box-shadow: 0rem 2rem 2.5rem 2rem rgba(3, 3, 3, 0.199);
}

.card .card-title {
  margin-bottom: 1.5rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}


</style>
