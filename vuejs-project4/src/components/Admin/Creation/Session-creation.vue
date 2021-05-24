<template>
    <div>
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Creation</li>
                <li class="breadcrumb-item active" aria-current="page">Session</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-6 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Creation</div>
                    <div class="card-body">
                        <h5 class="card-title text-center">Create Session</h5>
                        <form @submit.prevent="createSession" class="form-signin">
                            <div class="form-group">
                                <input type="text" id="inputName" v-model="name" class="form-control text-center text-white bg-dark" placeholder="Session Name" required autofocus>
                                <!-- <label for="inputName">Name</label> -->
                            </div>

                            <div class="form-group">
                                <div class="text-white bg-dark">
                                  <div class="col-sm-6 col-md-6 col-lg-6 mx-auto">
                                      Deactivate / Activate
                                      <label class="switch text-center text-white bg-dark">
                                          <input type="checkbox" id="inputStatus" v-model="status" class="info" >
                                          <span class="slider round"></span>
                                      </label>
                                  </div><br>
                                </div>
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
            status: false,
            msg: null
        }
    },
    methods: {
      async createSession() {
        // console.log(this.name)
        // console.log(this.sem)
        
        const baseURI = 'http://127.0.0.1:8000/api/create-session'
        this.$http.post(baseURI, {
          name : this.name,
          status: this.status
        })
        .then((res)=>{
            this.msg = res.data.msg;
            this.name = null;
            this.status = false;
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

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input,
.form-label-group select {
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


.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  float: right;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #f44336;
  -webkit-transition: .4s;
  transition: .5s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: rgba(19, 19, 19, 0.685);
  -webkit-transition: .4s;
  transition: .5s;
}

input.default:checked + .slider {
  background-color: #444;
}
input.info:checked + .slider {
  background-color: #3de0f5;
}
input.danger:checked + .slider {
  background-color: #f44336;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

.slider.round {
  border-radius: 1.5rem;
}

.slider.round:before {
  border-radius: 50%;
}
</style>