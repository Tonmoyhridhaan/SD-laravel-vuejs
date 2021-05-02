<template>
    <div>
        <h5 class="card-title text-center">Manage Course Type</h5>
        <div class="col-md">
            <h4 class="card-title text-center"><b>Active Type</b></h4>
            <form @submit.prevent="activeType" class="form-signin">

                <div class="">
                    <label for="inputSession">Choose Type</label>
                    <select id="inputSession" v-model="type" class="form-control" required>
                        <option v-for="t in types" v-if="!t.status" :key="t.id" :value="t.id" >{{t.name}}</option>
                    </select>
                    <label for=""></label>
                </div>

                <button class="btn btn-lg btn-success btn-block text-uppercase" type="submit">Active</button>

                <!-- <div v-if="msg" class="form-label-group">
                    <hr>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>{{ msg }}</strong>
                    </div>
                </div> -->
            </form>
        </div>
        <div class="row"><hr></div>
         <div class="col-md">
             <h4 class="card-title text-center"><b>Deactive Type</b></h4>
            <form @submit.prevent="deactiveType" class="form-signin">

                 <div class="">
                    <label for="inputSemester">Choose Type</label>
                    <select id="inputSemester" v-model="type" class="form-control" required>
                        <option v-for="t in types" v-if="t.status" :key="t.id" :value="t.id">{{t.name}}</option>
                    </select>
                    <label for=""></label>
                </div>

                <button class="btn btn-lg btn-danger btn-block text-uppercase" type="submit">Deactive</button>

                <!-- <div v-if="msg" class="form-label-group">
                    <hr>
                    <div class="alert alert-success alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert">&times;</button>
                        <strong>{{ msg }}</strong>
                    </div>
                </div> -->
            </form>
        </div>



    </div>
</template>

<script>
export default {
    data() {
        return {
            types: [],
            type: null,
            msg: null
        }
    },
    mounted(){
        this.getType();
        
    },
    methods: {
        getType(){
            const baseURI = 'http://127.0.0.1:8000/api/get-type'
            this.$http.get(baseURI)
            .then((res)=>{
                this.types = res.data.types
                this.msg = res.data.msg
            })
            
            //console.log(this.sessions);
        },
        async activeType() {
            const baseURI = 'http://127.0.0.1:8000/api/update-type'
            this.$http.post(baseURI, {
                id : this.type,
                status: 0
            })
            .then((res)=>{
                this.msg = res.data.msg;
                this.type = null;
                //this.sessions = [];
                alert(this.msg)
            })
            
            
        },
        async deactiveType() {
            const baseURI = 'http://127.0.0.1:8000/api/update-type'
            this.$http.post(baseURI, {
                id : this.type,
                status: 1
            })
            .then((res)=>{
                this.msg = res.data.msg;
                this.type = null;
                //this.sessions = [];
                alert(this.msg)
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

.card-signin {
  border: 0;
  border-radius: 4rem;
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
</style>