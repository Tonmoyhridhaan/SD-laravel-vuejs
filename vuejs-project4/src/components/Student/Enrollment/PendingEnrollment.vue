<template>
    <div>
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Enrollment</li>
                <li class="breadcrumb-item active" aria-current="page">Pending</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Pending List</div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4"></div>
                            <div class="col-4">
                                <div class="form-group text-center">
                                    <label for="">Select Available Session</label>
                                    <select class="form-control text-white bg-dark" :required="true" v-model="session" @change="sessionChange">
                                        <option :selected="true" :value="0">Please select one</option>
                                        <option v-for="s in sessions" :key="s.id" :value="s.id">{{s.name}}</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-4"></div>
                        </div>
                        <div v-show="session">
                            <h5 class="card-title text-center"> My Running Courses </h5>
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
                                    <b-table class="table table-hover table-striped table-sm table-dark" striped hover :items="list" :filter="filter" :per-page="perPage" :current-page="curPage" :fields="fields"> </b-table> 
                                </b-col>
                            </b-row>
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
            sessions: [],
            list: [],
            session: null,
            filter: "",
            perPage: 5,
            curPage: 1,
            fields:["SN", "Course Title", "Credit", "Section","Type", "Status"],
        }
    },
    computed:{
        rows(){
            return this.list.length;
        }
    },
    methods: {
        async sessionChange() {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-pending-list/' + token;
            const response = await this.$http.post(baseURI, {
                session_id: this.session
            });
            this.list = response.data.list;
            console.log(response.data);
        }
    },
    async created() {
        // const token = localStorage.getItem('token');
        const baseURL = 'http://127.0.0.1:8000/api/get-open-sessions';
        const response = await this.$http.get(baseURL);
        this.sessions = response.data.session;
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