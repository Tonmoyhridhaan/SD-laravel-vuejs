<template>
    <div class="wrapper">
        <div class="col-2">
            <div class="sidebar-container">
                <div class="sidebar-logo">
                    Student Panel
                </div>
                <ul class="sidebar-navigation">
                    <li class="header">Navigation</li>
                    <li>
                        <router-link to="/student/dashboard">
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
                            Enrollment
                        </a>
                        <ul class="sidebar-sub-nav" v-bind:style="{display: show1}">
                            <li>
                                <router-link to="/student/enrollment/enroll">
                                    <i class="fa fa-home" aria-hidden="true"></i> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-checklist" viewBox="0 0 16 16">
                                        <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                        <path d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0zM7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
                                    </svg>&emsp;
                                    Enroll
                                </router-link>
                            </li>
                            <li>
                                <router-link to="/student/enrollment/pending">
                                    <i class="fa fa-home" aria-hidden="true"></i> 
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
                                    </svg>&emsp;
                                    Pending
                                </router-link>
                            </li>
                        </ul>
                    </li>
                    <li class="header">Another Menu</li>
                    <li>
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
                    <router-link to="/student/information">
                        <i class="fa fa-info-circle" aria-hidden="true"></i> Information
                    </router-link>
                    </li>
                    <li>
                    <a href="javascript:void(0)" @click="handleClick">
                        <i class="fa fa-warning-circle" aria-hidden="true"></i> Logout
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
        if(role=='teacher'){
            this.$router.push('/teacher/dashboard');
        }
        else if(role=='admin'){
            this.$router.push('/admin/dashboard');
        }
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
  background-color: #47575f;
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
