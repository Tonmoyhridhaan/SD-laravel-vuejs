<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                <div class="card card-signin my-5">
                    <div class="card-body">
                        <h5 class="card-title text-center">Create Teacher</h5>
                        <form @submit.prevent="createTeacher" class="form-signin">
                            <div class="form-label-group">
                                <input type="name" id="inputName" v-model="name" class="form-control" placeholder="Full name" required autofocus>
                                <label for="inputName">Full name</label>
                            </div>
                            <div class="form-label-group">
                                <input type="email" id="inputEmail" v-model="email" class="form-control" placeholder="Email address" required autofocus>
                                <label for="inputEmail">Email address</label>
                            </div>

                            <div class="form-label-group">
                                <input type="password" id="inputPassword" v-model="password" class="form-control" placeholder="Password" required>
                                <label for="inputPassword">Password</label>
                            </div>

                            <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit">Create</button>
                        </form>
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
            name: null,
            email: null,
            password: null,
            role: 'teacher'
        }
    },
    methods: {
      async createTeacher() {
        // console.log(this.name)
        // console.log(this.email)
        // console.log(this.password)
        // console.log(this.role)
        
        const baseURI = 'http://127.0.0.1:8000/api/create-teacher'
        this.$http.post(baseURI, {
          name : this.name,
          email: this.email,
          password: this.password,
          role: this.role
        })
        .then((res)=>{
            alert(res.data.msg)
        })
      }
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