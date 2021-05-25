<template>
    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                <div class="card card-signin my-5 text-white bg-dark">
                <div class="card-body">
                    <h5 class="card-title text-center">Sign In</h5>
                    <form @submit.prevent="handle_submit" class="form-signin">
                      <div class="form-label-group text-white bg-dark">
                          <input type="email" id="inputEmail" v-model="email" class="form-control text-white bg-dark" placeholder="Email address" required autofocus>
                          <label for="inputEmail">Email address</label>
                      </div>

                      <div class="form-label-group text-white bg-dark">
                          <input type="password" id="inputPassword" v-model="password" class="form-control text-white bg-dark" placeholder="Password" required>
                          <label for="inputPassword">Password</label>
                      </div>

                      <button class="btn btn-lg btn-primary btn-block text-uppercase " type="submit">Sign in</button>
                    </form>
                </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'Login',
    data() {
      return {
        email: '',
        password: ''
      }
    },
    async created() {
        
        const role = localStorage.getItem('role');
        if(localStorage.getItem('token')){
            const role = localStorage.getItem('role');
            if(role=='teacher'){
                this.$router.push('/teacher/dashboard');
            }
            else if(role=='admin'){
                this.$router.push('/admin/dashboard');
            }
        }
    },
    methods: {
      async handle_submit() {
        const baseURI = 'http://127.0.0.1:8000/api/store-login'
        const response = await this.$http.post(baseURI, {
          email: this.email,
          password: this.password
        });
        if(response.data.flag=='1'){
          localStorage.setItem('token', response.data.user.id);
          localStorage.setItem('role', response.data.user.role);
          // console.log(response.data.user.role);
          if(response.data.user.role=='admin'){
            this.$router.push('/admin/dashboard');
          }
          else if(response.data.user.role=='student'){
            this.$router.push('/student/dashboard');
          } 
          else {
            this.$router.push('/teacher/dashboard');
          }
        }
        else {
          alert(response.data.msg);
        }
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
  background: #007bff;
  background: linear-gradient(to right, #000f22, #005085);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0rem 2rem 0 rgba(255, 255, 255, 0.342);
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
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
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
  color: #e2e2e2;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .5s ease-in-out;
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
  color: rgb(168, 186, 214);
}

/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}
</style>