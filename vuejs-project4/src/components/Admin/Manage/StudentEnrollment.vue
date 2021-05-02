<template>
  <div class="container">
        <h5 class="card-title text-center">Student Enrollment Requests</h5>
        <b-row>
            <b-col>
                <b-form-input v-model="filter" type="search" placeholder="Search"></b-form-input>
            </b-col>
        </b-row>
        <b-row>
            <b-col >
                 <b-table striped hover :items="enrolls" :filter="filter" :per-page="perPage" :current-page="curPage" :fields="fields">
                     <template v-slot:cell(Action)="data">
                         <b-button variant="success" @click.prevent="updateEnrollment(data.item.id)">Approve</b-button>
                     </template>
                     
                </b-table> 
                 <b-pagination v-model="curPage" :total-rows="rows" :per-page="perPage"></b-pagination>
            </b-col>
        </b-row>
        
  </div>
</template>

<script>
  export default {
    data() {
      return {
        enrolls: [],
        filter: "",
        perPage: 10,
        curPage: 1,
        fields:["student", "course", "type", "section","session","Action"],
        index: null
      }
    },
    mounted(){
        this.getEnrollment();
        
    },
    computed:{
        rows(){
            return this.enrolls.length;
        }
    },
    methods: {
        
        getEnrollment(){
            const baseURI = 'http://127.0.0.1:8000/api/get-enrollment'
            this.$http.get(baseURI)
            .then((res)=>{
                this.enrolls = res.data.enrolls
                this.msg = res.data.msg
            })
            
            //console.log(this.sessions);
        },
        updateEnrollment(id){
            this.index = id;
            const baseURI = 'http://127.0.0.1:8000/api/update-enrollment'
            this.$http.post(baseURI, {
                id : this.index,
            })
            .then((res)=>{
                this.msg = res.data.msg;
                alert(this.msg)
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
  box-shadow: 2rem 2rem 2rem 0 rgba(0, 0, 0, 0.1);
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