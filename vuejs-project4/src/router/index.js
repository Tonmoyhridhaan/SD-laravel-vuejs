import Vue from 'vue'
import Router from 'vue-router'
// import HelloWorld from '@/components/HelloWorld'
import Login from '@/components/Login'

import AdminDashboard from '@/components/Admin/Dashboard'
import StudentDashboard from '@/components/Student/Dashboard'
import TeacherDashboard from '@/components/Teacher/Dashboard'

import AdminSidebar from '@/components/Admin/Sidebar'
import StudentSidebar from '@/components/Student/Sidebar'
import TeacherSidebar from '@/components/Teacher/Sidebar'

import Information from '@/components/Admin/Information'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'Login',
      component: Login
    },
    {
      path: '/admin',
      component: AdminSidebar,
      children: [
        {
          path: 'dashboard',
          name: 'Dashboard',
          component: AdminDashboard
        },
        {
          path: 'information',
          name: 'Information',
          component: Information
        }
      ]
    },
    {
      path: '/student',
      component: StudentSidebar,
      children: [
        {
          path: 'dashboard',
          name: 'Dashboard',
          component: StudentDashboard
        },
        {
          path: 'information',
          name: 'Information',
          component: Information
        }
      ]
    },
    {
      path: '/teacher',
      component: TeacherSidebar,
      children: [
        {
          path: 'dashboard',
          name: 'Dashboard',
          component: TeacherDashboard
        },
        {
          path: 'information',
          name: 'Information',
          component: Information
        }
      ]
    }
  ]
})
