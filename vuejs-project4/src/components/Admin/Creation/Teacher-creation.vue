<template>
    <div>
          <br>
          <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Creation</li>
                  <li class="breadcrumb-item active" aria-current="page">Teacher</li>
              </ol>
          </nav>
          <hr>
          <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                    <div class="card text-white bg-dark">
                        <div class="card-header">Creation</div>
                        <div class="card-body">
                        <h5 class="card-title text-center">Create Teacher</h5>
                        <form @submit.prevent="createTeacher" class="form-signin">
                            <div class="form-group">
                                <input type="name" id="inputName" v-model="name" class="form-control text-center text-white bg-dark" placeholder="Full name" required autofocus>
                                <!-- <label for="inputName">Full Name</label> -->
                            </div>
                            <div class="form-group">
                                <input type="email" id="inputEmail" v-model="email" class="form-control text-center text-white bg-dark" placeholder="Email address" required autofocus>
                                <!-- <label for="inputEmail">Email address</label> -->
                            </div>

                            <div class="form-group">
                                <input type="password" id="inputPassword" v-model="password" class="form-control text-center text-white bg-dark" placeholder="Password" required>
                                <!-- <label for="inputPassword">Password</label> -->
                            </div>

                            <button class="btn btn-lg btn-info btn-block text-uppercase" type="submit">Create</button>
                            
                            <div v-if="msg" class="form-group">
                                <hr>
                                <div class="alert alert-success alert-dismissible">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <strong>{{ msg }}</strong>
                                </div>
                            </div>
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
            role: 'teacher',
            msg : null
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
            this.msg = res.data.msg;
            this.name = null;
            this.email = null;
            this.password = null;
        })
      }
    }
}
</script>
<style scoped>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}
.breadcrumb {
    margin-bottom: 0;
    background-color:  #00000036;
    font-weight: bold;
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

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 0.5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-group {
  position: relative;
  margin-bottom: 2rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}
</style>