<template>
    <div>
        <h5 class="card-title text-center">Marks Distribution</h5>
        <form @submit.prevent="createDistribution">
            
            <div class="form-group">
                <label for="">Select Session</label>
                <select class="form-control text-white bg-dark" :required="true" @change="sessionChange" v-model="session">
                  <option :selected="true">Please select one</option>
                  <option v-for="s in sessions" :key="s.id" :value="s.id">{{s.name}}</option>
                </select>
            </div>

            <div v-show="session" class="form-group">
                <label for="">Select Course</label>
                <select class="form-control text-white bg-dark" :required="true" @change="courseChange" v-model="course">
                  <option :selected="true">Please select one</option>
                  <option v-for="c in courses" :key="c.id" :value="c.id">{{c.name}}</option>
                </select>
            </div>

            <div v-show="course" class="form-group" @change="sectionChange">
                <label class="form-check-label" for="">Select Sections: </label> 
                <div  v-for="s in sections" :key="s.id">
                   &emsp;<input :value="s.id" type="checkbox" v-model="section"> &emsp;{{ s.name}}
                </div>
            </div>

            <div v-if="fg">
                <div class="row">
                    <div class="col-md-4 portlets">
                        <button v-show="total_marks!=100" type='button' class="btn btn-info" @click="addNewRow">
                            <i class="fas fa-plus-circle">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill" viewBox="0 0 16 16">
                                    <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
                                </svg>
                            </i>
                            Add
                        </button>
                    </div>
                    <div class="col-md-4 text-right">
                        Total Marks:
                    </div>
                    <div class="col-md-4">
                        <input readonly class="form-control bg-dark text-white" type="number" v-model="total_marks"/>
                    </div>
                </div>

                <div v-show="total_marks>100" class="form-group"><br>
                    <div class="alert alert-danger" role="alert">
                        Marks Limit Exceeded <small> <strong> Please Choose Between 0 to 100 </strong> </small>
                    </div>
                </div>

                <hr>

                <table>
                    <tr v-for="(category, k) in categories" :key="k">
                        <td scope="row" class="btn btn-danger">
                            <i @click="deleteRow(k, category)">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                                </svg>
                            </i>
                        </td>&emsp;
                        <td>
                            <input class="form-control text-center text-white bg-dark" type="text" placeholder="enter catagory"  v-model="category.name" />
                        </td>
                        <td>
                            <input class="form-control text-center text-white bg-dark" type="number" placeholder="enter number" v-model="category.value" @change="calculateLineTotal(category)"
                            />
                        </td>
                        <td hidden>
                            <input readonly class="form-control text-right" type="number" v-model="category.line_total" />
                        </td>
                    </tr>
                </table>
            </div>

            <div v-show="total_marks==100" class="form-group"><hr>
                <button type="submit" class="btn btn-success text-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cloud-upload-fill" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M8 0a5.53 5.53 0 0 0-3.594 1.342c-.766.66-1.321 1.52-1.464 2.383C1.266 4.095 0 5.555 0 7.318 0 9.366 1.708 11 3.781 11H7.5V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11h4.188C14.502 11 16 9.57 16 7.773c0-1.636-1.242-2.969-2.834-3.194C12.923 1.999 10.69 0 8 0zm-.5 14.5V11h1v3.5a.5.5 0 0 1-1 0z"/>
                    </svg>
                    Save Distribution
                </button>
            </div>

            <div v-show="fg1" class="form-group alert alert-success alert-dismissible fade show">
                <button type="button" v-on:click="alertCross" class="close" data-dismiss="alert">&times;</button>
                <strong>Marks Distribution Created Successfully!</strong>
            </div>

        </form>
    </div>
</template>

<script>
export default {
    data() {
        return {
            sessions: [],
            session: null,
            courses: [],
            course: null,
            sections: [],
            section: [],
            fg: false,
            fg1: 0,
            total_marks: 0,
            categories: [{
                name: '',
                value: '',
                line_total: 0
            }]
        }
    },
    async created() {
        const token = localStorage.getItem('token');
        const baseURI = 'http://127.0.0.1:8000/api/get-assigned-teacher-session/' + token;
        const response = await this.$http.get(baseURI);
        this.sessions = response.data.session;
    },
    methods: {
        async sessionChange () {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-assigned-teacher-course/' + token;
            const response = await this.$http.post(baseURI, {
              session_id: this.session
            });
            this.courses = response.data.course;
        },
        async courseChange () {
            const token = localStorage.getItem('token');
            const baseURI = 'http://127.0.0.1:8000/api/get-assigned-teacher-section/' + token;
            const response = await this.$http.post(baseURI, {
              session_id: this.session,
              course_id: this.course
            });
            this.sections = response.data.section;
        },
        sectionChange () {
            this.fg = true;
        },
        async createDistribution () {
            const baseURI = 'http://127.0.0.1:8000/api/create-distribution';
            const response = await this.$http.post(baseURI, {
                teacher_id: localStorage.getItem('token'),
                session_id: this.session,
                course_id: this.course,
                sections_id: this.section,
                categories: this.categories
            });
            // console.log(response.data);
            this.fg1 = response.data.fg;
        },
        async alertCross () {
            this.session = null;
            this.course = null;
            this.section = [];
            this.fg = false;
            this.fg1 = 0;
            this.total_marks = 0;
            this.categories = [{
                name: '',
                value: '',
                line_total: 0
            }];
        },
        addNewRow() {
            this.categories.push({
                name: '',
                value: '',
                line_total: 0
            });
        },
        calculateTotal() {
            var subtotal;
            subtotal = this.categories.reduce(function (sum, category) {
                var lineTotal = parseFloat(category.line_total);
                if (!isNaN(lineTotal)) {
                    return sum + lineTotal;
                }
            }, 0);

            this.total_marks = subtotal;
        },
        calculateLineTotal(category) {
            var total = category.value;
            if (!isNaN(total)) {
                category.line_total = total;
            }
            this.calculateTotal();
        },
        deleteRow(index, category) {
            var idx = this.categories.indexOf(category);
            console.log(idx, index);
            if (idx > -1) {
                this.categories.splice(idx, 1);
            }
            this.calculateTotal();
        }
    }
}
</script>
<style>
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