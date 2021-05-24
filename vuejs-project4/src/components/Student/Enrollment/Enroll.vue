<template>
    <div>
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Enrollment</li>
                <li class="breadcrumb-item active" aria-current="page">Enroll</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
                <div class="card text-white bg-dark">
                    <div class="card-header">Enrollment</div>
                    <div class="card-body">
                        <form @submit.prevent="enrollProceed">
                            <div class="row">
                                <div class="col-4"></div>
                                <div class="col-4">
                                    <div class="form-group text-center">
                                        <label for="">Select Available Session</label>
                                        <select class="form-control text-white bg-dark" :required="true" v-model="session">
                                            <option :selected="true" :value="0">Please select one</option>
                                            <option v-for="s in sessions" :key="s.id" :value="s.id">{{s.name}}</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-4"></div>
                            </div>
                            <div v-show="session">
                                <h5 class="card-title text-center"> Available Courses </h5>
                                <table class="table table-hover table-striped table-sm table-dark">
                                    <thead>
                                        <tr class="d-flex">
                                            <th class="col-1">Choose</th>
                                            <th class="col-1">#S/N</th>
                                            <th class="col-3">Course Title</th>
                                            <th class="col-2">Credit</th>
                                            <th class="col-3">Section</th>
                                            <th class="col-2">Type</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="d-flex" v-for="(list,i) in lists"   :key="i">
                                            <td class="col-sm-1">
                                                <div class="form-check">
                                                    <input type="checkbox" class="form-check-input" v-model="list.check_list" :value="list.id">
                                                </div>
                                            </td>
                                            <td class="col-sm-1">{{ list.id }}</td>
                                            <td class="col-sm-3">{{ list.crs_name+' ('+list.type+')' }}</td>
                                            <td class="col-sm-1">{{ list.credit }}</td>
                                            <td class="col-sm-3">
                                                <div class="dropdown">
                                                    <select class="form-control text-white bg-secondary" v-model="list.sec" >
                                                        <option value=" ">-select section-</option>
                                                        <option v-for="s in list.section" :key="s.id" :value="s.id">{{ s.name }}</option> 
                                                    </select>
                                                </div>
                                            </td>
                                            <td class="col-sm-3">
                                                <div class="form-group">
                                                    <select class="form-control text-white bg-secondary" v-model="list.ver">
                                                        <option value=" ">-select course type-</option>
                                                        <option v-for="t in list.version" :key="t.id" :value="t.id">{{ t.name }}</option>
                                                    </select>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div v-if="fg" class="form-group"><hr>
                                    <div class="form-group text-center alert alert-danger">
                                        <strong>Enrollment Requested!</strong> <br> <router-link to="/student/enrollment/pending"> <small><strong> Click Here To Check pendings Request </strong></small></router-link>
                                    </div>
                                </div>
                                <hr>
                                <div class="row">
                                    <div class="col-5"></div>
                                    <div class="col-5">
                                        <div class="form-group">
                                            <button type="submit" class="btn btn-info text-center">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-upload-fill" viewBox="0 0 16 16">
                                                    <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.5 14.5V11h1v3.5a.5.5 0 0 1-1 0z"/>
                                                </svg>
                                                Enroll Proceed
                                            </button>
                                        </div>
                                    </div>
                                    <div class="col-2"></div>
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
            fg: null,
            sessions: [],
            session: null,
            lists: [{
                id: null,
                crs_name: null,
                type: null,
                credit: null,
                version: [{
                    id: null,
                    name: null
                }],
                section: [{
                    id: null,
                    name: null
                }],
                check_list: null,
                sec: null,
                ver: null
            }],
        }
    },
    computed:{
        rows(){
            return this.dist_list.length;
        }
    },
    methods: {
        async enrollProceed () {
            console.log(localStorage.getItem('token'));
            let course_ids = [];
            let type_ids = [];
            let section_ids = [];
            var k = 0;
            for (var i=0; i<this.lists.length ;i++) {
                if(this.lists[i].check_list) {
                    course_ids[k] = this.lists[i].id;
                    section_ids[k] = this.lists[i].sec;
                    type_ids[k++] = this.lists[i].ver;
                }
            }
            console.log(course_ids);
            console.log(section_ids);
            console.log(type_ids);
            const baseURI = 'http://127.0.0.1:8000/api/assign-enroll';
            const response = await this.$http.post(baseURI, {
                student_id: localStorage.getItem('token'),
                course_id: course_ids,
                type_id: type_ids,
                section_id: section_ids,
                session_id: this.session,
            });
            this.fg = response.data.flag;
            console.log(response.data);
        }
    },
    async created() {
        // const token = localStorage.getItem('token');
        const baseURL1 = 'http://127.0.0.1:8000/api/get-open-sessions';
        const response1 = await this.$http.get(baseURL1);
        this.sessions = response1.data.session;

        const baseURL2 = 'http://127.0.0.1:8000/api/get-course-list';
        const response2 = await this.$http.get(baseURL2);
        this.lists = response2.data.list;
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