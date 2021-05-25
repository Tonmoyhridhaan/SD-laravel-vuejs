
<template>
    <div>
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Manage</li>
                <li class="breadcrumb-item active" aria-current="page">Enrollment Requests</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Requests</div>
                    <div class="card-body">
                          <h5 class="card-title text-center">Student Enrollment Requests</h5>
                           <b-row>
                                <b-col>
                                    <div class="row">
                                        <div class="col-3">
                                            <b-form-input v-model="filter" class="text-white bg-dark" align="left" type="search" placeholder="Search"></b-form-input><br>
                                        </div>
                                        <div class="col-9">
                                            <b-pagination class="customPagination" align="right" v-model="curPage"  :total-rows="rows" :per-page="perPage"></b-pagination>
                                        </div>
                                    </div>
                                </b-col>
                            </b-row>
                          <b-row>
                              <b-col >
                                  <b-table  class="table table-hover table-striped table-sm table-dark" striped hover :items="enrolls" :filter="filter" :per-page="perPage" :current-page="curPage" :fields="fields">
                                      <template v-slot:cell(Action)="data">
                                          <b-button variant="success" @click.prevent="approveEnrollment(data.item.id)">Approve</b-button>
                                          <b-button variant="danger" @click.prevent="rejectEnrollment(data.item.id)">Reject</b-button>
                                      </template>
                                  </b-table> 
                              </b-col>
                          </b-row>
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
        approveEnrollment(id){
            this.index = id;
            const baseURI = 'http://127.0.0.1:8000/api/update-enrollment'
            this.$http.post(baseURI, {
                id : this.index,
                status : 1
            })
            .then((res)=>{
                this.msg = res.data.msg;
                alert(this.msg)
            })
            
        },
        rejectEnrollment(id){
            this.index = id;
            const baseURI = 'http://127.0.0.1:8000/api/update-enrollment'
            this.$http.post(baseURI, {
                id : this.index,
                status : 2
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
.breadcrumb {
    margin-bottom: 0;
    background-color:  #00000036;
    font-weight: bold;
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
.page-item.active .page-link {  
    background-color: rgb(42, 41, 41) !important;  
    border-color: rgb(44, 161, 230) !important;  
}
.page-item .page-link {  
    background-color: rgb(42, 41, 41) !important;  
    border-color: rgb(44, 161, 230) !important;  
}

</style>