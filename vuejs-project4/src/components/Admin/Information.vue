<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <div v-if="user">
                            <h5 class="card-title text-center" >{{ user.name }}</h5>
                            <h4 class="card-title text-center" >{{ user.email }}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
             user: null
        }
    },
    async created() {
        const token = localStorage.getItem('token');
        const baseURI = 'http://127.0.0.1:8000/api/get-user/' + token;
        const response = await this.$http.get(baseURI, {
            headers: {
                Authorization: 'Bearer' + token
            }
        });
        this.user = response.data.user;
        console.log(response.data.user);
    }
}
</script>
<style>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #b47722;
  background: linear-gradient(to right, #492e02, #ffb01e);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}
</style>