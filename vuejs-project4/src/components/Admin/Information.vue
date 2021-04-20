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
