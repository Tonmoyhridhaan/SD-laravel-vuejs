<template>
    <div>
        <h5 class="card-title text-center">Create Course</h5>
        <form @submit.prevent="createCourse" class="form-signin">
            <div class="form-label-group">
                <input type="text" id="inputName" v-model="name" class="form-control" placeholder="Course Name" required autofocus>
                <label for="inputName">Name</label>
            </div>
            <div class="form-label-group">
                <input type="text" id="inputCode" v-model="code" class="form-control" placeholder="Course Code" required autofocus>
                <label for="inputCode">Code</label>
            </div>

            <div class="form-label-group">
                <input type="text" id="inputCredit" v-model="credit" class="form-control" placeholder="Course Credit" required>
                <label for="inputCredit">Credit</label>
            </div>

            <div class="">
                 <label for="inputType">Course Type</label>
                <select id="inputType" v-model="type" class="form-control" required>
                    <option v-for="type in types" :key="type.id" :value="type.value">{{type.name}}</option>
                </select>
                <label for="inputType"></label>
            </div>

            <div class="">
                <label for="inputSemester">Semester</label>
                <select id="inputSemester" v-model="sem" class="form-control" required>
                    <option v-for="sem in sems" :key="sem.id" :value="sem.id">{{sem.id}}</option>
                </select>
                <label for="inputSemester"></label>
            </div>

            <button class="btn btn-lg btn-warning btn-block text-uppercase" type="submit">Create</button>

            <div v-if="msg" class="form-label-group">
                <hr>
                <div class="alert alert-success alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>{{ msg }}</strong>
                </div>
            </div>
        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            
            name: null,
            code: null,
            credit: null,
            msg : null,
            type: null,
            types: [
                {id:1, name: 'Theory', value: 'theory'},
                {id:2, name: 'Lab', value: 'lab'}
            ],
            sem: null,
            sems: [
                {id:1},
                {id:2},
                {id:3},
                {id:4},
                {id:5},
                {id:6},
                {id:7},
                {id:8},
            ],

        }
    },
    methods: {
      async createCourse() {
        // console.log(this.name)
        // console.log(this.code)
        // console.log(this.credit)
        // console.log(this.type)
        // console.log(this.sem)
        
        const baseURI = 'http://127.0.0.1:8000/api/create-course'
        this.$http.post(baseURI, {
          name : this.name,
          code: this.code,
          credit: this.credit,
          type: this.type,
          sem: this.sem
        })
        .then((res)=>{
            this.msg = res.data.msg;
            this.name = null;
            this.code = null;
            this.credit = null;
            this.type = null;
            this.sem = null;
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