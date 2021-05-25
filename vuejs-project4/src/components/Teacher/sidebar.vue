<template>
    <div class="wrapper">
        <div class="col-2">
            <div class="sidebar-container">
                <div class="sidebar-logo">
                    Teacher Panel
                </div>
                <div class="sidebar-logo1">
                    <li class="header btn btn-dark btn-block"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
                        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
                        </svg> &emsp; <strong>{{ user.name }}</strong>
                    </li>
                </div>
                <ul class="sidebar-navigation">
                    <li class="header">Navigation</li>
                    <li>
                        <router-link to="/teacher/dashboard">
                            <i class="fa fa-home" aria-hidden="true"></i>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293l6-6zm5-.793V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
                                <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
                            </svg>&emsp;
                            Dashboard
                        </router-link>
                    </li>
                    <li>
                        <a href="javascript:void(0);" class="" @click="subToggle1">
                            <i class="fa fa-tachometer" aria-hidden="true"></i>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-menu-button-wide-fill" viewBox="0 0 16 16">
                                <path d="M1.5 0A1.5 1.5 0 0 0 0 1.5v2A1.5 1.5 0 0 0 1.5 5h13A1.5 1.5 0 0 0 16 3.5v-2A1.5 1.5 0 0 0 14.5 0h-13zm1 2h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1zm9.927.427A.25.25 0 0 1 12.604 2h.792a.25.25 0 0 1 .177.427l-.396.396a.25.25 0 0 1-.354 0l-.396-.396zM0 8a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v5a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V8zm1 3v2a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1v-2H1zm14-1V8a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v2h14zM2 8.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
                            </svg>&emsp;
                             Distribution
                        </a>
                        <ul class="sidebar-sub-nav" v-bind:style="{display: show1}">
                            <li>
                                <router-link to="/teacher/distribution/marks">
                                    <i class="fa fa-home" aria-hidden="true"></i> Marks
                                </router-link>
                            </li>
                            <li>
                                <router-link to="/teacher/distribution/show">
                                    <i class="fa fa-home" aria-hidden="true"></i> List
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <router-link to="/teacher/assign-marks">
                            <i class="fa fa-home" aria-hidden="true"></i> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-journal-check" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M10.854 6.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 8.793l2.646-2.647a.5.5 0 0 1 .708 0z"/>
                                <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2z"/>
                                <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1H1z"/>
                            </svg>&emsp;
                            Assign Marks
                        </router-link>
                    </li>
                    <li class="header">Another Menu</li>
                    <!-- <li>
                    <router-link to="#">
                        <i class="fa fa-users" aria-hidden="true"></i> Friends
                    </router-link>
                    </li>
                    <li>
                    <router-link to="#">
                        <i class="fa fa-cog" aria-hidden="true"></i> Settings
                    </router-link>
                    </li>
                    <li>
                    <router-link to="/teacher/information">
                        <i class="fa fa-info-circle" aria-hidden="true"></i> Information
                    </router-link>
                    </li> -->
                    <li>
                        <a href="javascript:void(0)" @click="handleClick">
                            <i class="fa fa-warning-circle" aria-hidden="true"></i> 
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-reply-all-fill" viewBox="0 0 16 16">
                                <path d="M8.021 11.9 3.453 8.62a.719.719 0 0 1 0-1.238L8.021 4.1a.716.716 0 0 1 1.079.619V6c1.5 0 6 0 7 8-2.5-4.5-7-4-7-4v1.281c0 .56-.606.898-1.079.62z"/>
                                <path d="M5.232 4.293a.5.5 0 0 1-.106.7L1.114 7.945a.5.5 0 0 1-.042.028.147.147 0 0 0 0 .252.503.503 0 0 1 .042.028l4.012 2.954a.5.5 0 1 1-.593.805L.539 9.073a1.147 1.147 0 0 1 0-1.946l3.994-2.94a.5.5 0 0 1 .699.106z"/>
                            </svg>&emsp;
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-10">
            <router-view></router-view>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
             user: null,
             show1: 'none',
             fg: true
        }
    },
    methods: {
        handleClick() {
            localStorage.removeItem('token');
            localStorage.removeItem('role');
            this.$router.push('/');
        },
        subToggle1() {
            if(this.fg) this.show1 = 'block';
            else this.show1 = 'none';
            this.fg ^= 1;
            console.log(this.fg);
        }
    },
    async created() {
        const token = localStorage.getItem('token');
         const role = localStorage.getItem('role');
        if(!localStorage.getItem('token')){
            this.$router.push('/');
        }
        if(role=='admin'){
            this.$router.push('/admin/dashboard');
        }
        else if(role=='student'){
            this.$router.push('/student/dashboard');
        }
        const baseURI = 'http://127.0.0.1:8000/api/get-user/' + token;
        const response = await this.$http.get(baseURI, {
            headers: {
                Authorization: 'Bearer' + token
            }
        });
        this.user = response.data.user;
        console.log(response.data.user);
        // const baseURI = 'http://127.0.0.1:8000/api/get-user/' + token;
        // const response = await this.$http.get(baseURI);
        // console.log(response.data.user);
    }
}
</script>
<style>
.wrapper {
    display: flex;
    width: 100%;
}
.sidebar-logo {
  padding: 10px 15px 10px 30px;
  font-size: 20px;
  background-color: #363636;
}
.sidebar-logo1 {
  padding: 10px 15px 10px 30px;
  font-size: 20px;
  background-color: #131212;
}
.sidebar-navigation li::before {
  background-color: #363636;
  position: absolute;
  content: '';
  height: 100%;
  left: 0;
  top: 0;
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 3px;
  z-index: -1;
}
.sidebar-sub-nav li::before {
  background-color: #818181;
  position: absolute;
  content: '';
  height: 95%;
  left: 1%;
  top: 0;
  -webkit-transition: width 0.2s ease-in;
  transition: width 0.2s ease-in;
  width: 3px;
  z-index: -1;
}
</style>
