<template>
    <div>
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Distribution</li>
                <li class="breadcrumb-item active" aria-current="page">List</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Distribution</div>
                    <div class="card-body">
                        <h5 class="card-title text-center"> My Marks Distributions </h5>
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
                                <b-table class="text-white bg-dark" striped hover :items="dist_list" :filter="filter" :per-page="perPage" :current-page="curPage" :fields="fields"> </b-table> 
                            </b-col>
                        </b-row>
                        <!-- <table class="table table-hover table-dark">
                            <thead>
                                <tr>
                                <th scope="col">#</th>
                                <th scope="col">Course Title</th>
                                <th scope="col">Session</th>
                                <th scope="col">Section</th>
                                <th scope="col">Category Name</th>
                                <th scope="col">Marks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="dist in dist_list"   :key="dist.id">
                                  <td scope="row" ><strong>{{dist.id}}</strong></td>
                                  <td>{{ dist.course_name }}</td>
                                  <td>{{ dist.session_name }}</td>
                                  <td>{{ dist.section_name }}</td>
                                  <td>{{ dist.catagory_name }}</td>
                                  <td>{{ dist.marks }}</td>
                                </tr>
                                
                            </tbody>
                        </table> -->
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
            dist_list: [],
            filter: "",
            perPage: 5,
            curPage: 1,
            fields:["SN", "Course Title", "Session", "Section","Category Name","Marks"],
        }
    },
    computed:{
        rows(){
            return this.dist_list.length;
        }
    },
    async created() {
        const token = localStorage.getItem('token');
        const baseURI = 'http://127.0.0.1:8000/api/get-assigned-distribution/' + token;
        const response = await this.$http.get(baseURI);
        this.dist_list = response.data.distList;
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