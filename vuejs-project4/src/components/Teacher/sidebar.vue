<template>
    <div class="wrapper">
        <div class="col-2">
            <div class="sidebar-container">
                <div class="sidebar-logo">
                    Teacher Panel
                </div>
                <ul class="sidebar-navigation">
                    <li class="header">Navigation</li>
                    <li>
                    <router-link to="/teacher/dashboard">
                        <i class="fa fa-home" aria-hidden="true"></i> Homepage
                    </router-link>
                    </li>
                    <li>
                    <router-link to="/teacher/dashboard">
                        <i class="fa fa-tachometer" aria-hidden="true"></i> Dashboard
                    </router-link>
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
                    <router-link to="/teacher/information">
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
             user: null
        }
    },
    methods: {
        handleClick() {
            localStorage.removeItem('token');
            localStorage.removeItem('role');
            this.$router.push('/');
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
  background-color: #4e008d;
}
.sidebar-navigation li::before {
  background-color: #8239bd;
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
</style>
