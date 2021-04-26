<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Distribution</div>
                    <div class="card-body">
                        <!-- <div>
                            <h5 class="card-title text-center" >Distribution</h5>
                            <hr>
                        </div> -->
                        <router-view></router-view>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</template>

<script>
export default {

}
</script>

<style>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #525252;
  background: linear-gradient(to right, #2c2c2cee, #1d1d1d);
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
