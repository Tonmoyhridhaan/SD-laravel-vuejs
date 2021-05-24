<template>
    <div class="container">
        <br>
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
                <li class="breadcrumb-item active" aria-current="page">Assign Marks</li>
            </ol>
        </nav>
        <hr>
        <div class="row">
            <div class="col-sm-11 col-md-11 col-lg-11 mx-auto">
                <div class="card dark text-white bg-dark">
                    <div class="card-header">Marks assignation</div>
                    <div class="card-body">
                        <div class="row">
                            
                            <div class="col-4">
                                <div class="form-group">
                                    <label for="">Select Available Session</label>
                                    <select class="form-control text-white bg-dark" :required="true" @change="sessionChange" v-model="session">
                                        <option :selected="true" :value="0">Please select one</option>
                                        <option v-for="s in sessions" :key="s.id" :value="s.id">{{s.name}}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-4">
                                <div v-show="session" class="form-group">
                                    <label for="">Select Available Course</label>
                                    <select class="form-control text-white bg-dark" :required="true" @change="courseChange" v-model="course">
                                        <option :selected="true" :value="0">Please select one</option>
                                        <option v-for="c in courses" :key="c.id" :value="c.id">{{c.name}}</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-4">
                                <div v-show="course && session" class="form-group">
                                    <label for="">Select Available Section</label>
                                    <select class="form-control text-white bg-dark" :required="true" @change="sectionChange" v-model="section">
                                        <option :selected="true" :value="0">Please select one</option>
                                        <option v-for="s in sections" :key="s.id" :value="s.id">{{s.name}}</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div v-show="session && course && section">
                            <h5 class="card-title text-center"> Enrolled Students </h5>
                            <form @submit.prevent="updateStdMarks">
                                <table class="table table-hover table-dark">
                                    <thead>
                                        <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">ID</th>
                                        <th scope="col">Name</th>
                                        <th scope="col" v-for="i in data" :key="i.id">{{i.name+'('+i.marks+')'}}</th>
                                        <th scope="col">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(li,i) in list" :key="i">
                                            <td>{{ li.i }}</td>
                                            <td>{{ li.id }}</td>
                                            <td>{{ li.name }}</td>
                                            <td v-for="(mark, j) in li.marks" :key="j">
                                                <input class="form-control text-center text-white bg-dark" type="number" v-model="mark.numbers" @change="calculateLineTotal(i)"/>
                                            </td>
                                            <td> 
                                                <div class="form-group has-warning has-feedback">
                                                    <input readonly disabled class="form-control text-center text-white bg-dark" type="number" v-model="li.total"/>
                                                    <div v-show="li.total>100"> <span class="badge badge-danger">Limit Exceeded</span> </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div v-if="fg" class="form-group"><hr>
                                    <div class="form-group alert alert-success alert-dismissible fade show">
                                        <strong>Changes Saved!</strong>
                                    </div>
                                </div>
                                <div class="form-group"><hr>
                                    <button type="submit" class="btn btn-success text-center">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-upload-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.5 14.5V11h1v3.5a.5.5 0 0 1-1 0z"/>
                                        </svg>
                                        Save Changes
                                    </button>
                                </div>
                            </form>
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
            fg :0,
            sessions: [],
            session: null,
            courses: [],
            course: null,
            sections: [],
            section: null,
            fg: false,
            total_marks: 0,
            data: [],
            list: [{
                i: null,
                id: null,
                marks: [{
                    id: null,
                    numbers: null,
                    line_total: 0
                }],
                name: ''
            }]
        }
    },
    async created() {
        const token = localStorage.getItem('token');
        const baseURI = 'http://127.0.0.1:8000/api/get-assigned-dist-teacher-session/' + token;
        const response = await this.$http.get(baseURI);
        this.sessions = response.data.session;
    },
    methods: {
        async sessionChange () {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-assigned-dist-teacher-course/' + token;
            const response = await this.$http.post(baseURI, {
              session_id: this.session
            });
            this.courses = response.data.course;
            console.log(this.courses);
        },
        async courseChange () {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-assigned-dist-teacher-section/' + token;
            const response = await this.$http.post(baseURI, {
              session_id: this.session,
              course_id: this.course
            });
            this.sections = response.data.section;
        },
        async sectionChange () {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-assigned-dist-teacher/' + token;
            const response = await this.$http.post(baseURI, {
              session_id: this.session,
              course_id: this.course,
              section_id: this.section
            });
            this.data = response.data.obj;
            this.list = response.data.list;
            console.log(this.list);
            console.log(this.list.marks);
        },
        calculateLineTotal(i) {
            var subTotal = parseInt(0);
            for(var j=0; j < this.list[i].marks.length ;j++){
                subTotal += parseInt(this.list[i].marks[j].numbers);
            }
            this.list[i].total = parseInt(subTotal); 
            console.log(parseInt(subTotal));
        },
        async updateStdMarks() {
            let ids = [];
            let marks = [];
            var k = parseInt(0);
            for (var i=0; i<this.list.length ;i++) {
                for (var j=0; j<this.list[i].marks.length ;j++) {
                    ids[k] = this.list[i].marks[j].id;
                    marks[k++] = this.list[i].marks[j].numbers;
                }
            }

            const baseURI = 'http://127.0.0.1:8000/api/update-student-marks';
            const response = await this.$http.post(baseURI, {
                ids: ids,
                marks: marks
            });
            this.fg = 1;
            // console.log(response.data);
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
  background: #525252;
  background: linear-gradient(to right, #414141ee, #1d1d1d);
}

.breadcrumb {
    margin-bottom: 0;
    background-color:  #00000036;
    font-weight: bold;
}

.dark {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.dark .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.dark .card-body {
  padding: 2rem;
}
</style>