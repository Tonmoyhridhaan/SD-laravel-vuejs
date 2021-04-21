import Vue from 'vue'
import Router from 'vue-router'

import Login from '@/components/Login'

import AdminDashboard from '@/components/Admin/Dashboard'
import AdminSidebar from '@/components/Admin/Sidebar'
import AInformation from '@/components/Admin/Information'
import Creation from '@/components/Admin/Creation/Creation'
import Tcreation from '@/components/Admin/Creation/Teacher-creation'
import Stdcreation from '@/components/Admin/Creation/Student-creation'
import Sescreation from '@/components/Admin/Creation/Session-creation'
import Seccreation from '@/components/Admin/Creation/Section-creation'
import Crscreation from '@/components/Admin/Creation/Course-creation'

import StudentDashboard from '@/components/Student/Dashboard'
import StudentSidebar from '@/components/Student/Sidebar'
import SInformation from '@/components/Student/Information'

import TeacherDashboard from '@/components/Teacher/Dashboard'
import TeacherSidebar from '@/components/Teacher/Sidebar'
import TInformation from '@/components/Teacher/Information'

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
          component: AInformation
        },
        {
          path: 'creation',
          name: 'Creation',
          component: Creation,
          children: [
            {
              path: 'teacher',
              name: 'Tcreation',
              component : Tcreation
            },
            {
              path: 'student',
              name: 'Stdcreation',
              component : Stdcreation
            },
            {
              path: 'session',
              name: 'Sescreation',
              component : Sescreation
            },
            {
              path: 'section',
              name: 'Seccreation',
              component : Seccreation
            },
            {
              path: 'course',
              name: 'Crscreation',
              component : Crscreation
            }
          ]
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
          component: SInformation
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
          component: TInformation
        }
      ]
    }
  ]
})
