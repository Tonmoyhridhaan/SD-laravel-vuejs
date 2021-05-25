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
import Manage from '@/components/Admin/Manage/Manage'
import Session from '@/components/Admin/Manage/Session'
import StudentEnrollment from '@/components/Admin/Manage/StudentEnrollment'
import EnrollmentStatus from '@/components/Admin/Manage/EnrollmentStatus'
import TeacherAssign from '@/components/Admin/Manage/TeacherAssign'

import StudentDashboard from '@/components/Student/Dashboard'
import StudentSidebar from '@/components/Student/Sidebar'
import SInformation from '@/components/Student/Information'
import Enrollment from '@/components/Student/Enrollment/Enrollment'
import Enroll from '@/components/Student/Enrollment/Enroll'
import Pending from '@/components/Student/Enrollment/PendingEnrollment'
import Results from '@/components/Student/Results'

import TeacherDashboard from '@/components/Teacher/Dashboard'
import TeacherSidebar from '@/components/Teacher/Sidebar'
import TInformation from '@/components/Teacher/Information'
import Distribution from '@/components/Teacher/Distribution/Dist'
import Marks from '@/components/Teacher/Distribution/Marks'
import Show from '@/components/Teacher/Distribution/Show'
import AssignMarks from '@/components/Teacher/Assign/Marks'

import Datatable from '@/components/Datatable'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/datatable',
      name: 'Datatable',
      component: Datatable

    },
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
        },
        {
          path: 'manage',
          name: 'Manage',
          component: Manage,
          children: [
            {
              path: 'session',
              name: 'Session',
              component : Session
            },
            {
              path: 'student-enrollment',
              name: 'StudentEnrollment',
              component : StudentEnrollment
            },
            {
              path: 'enrollment-status',
              name: 'EnrollmentStatus',
              component : EnrollmentStatus
            },
            {
              path: 'teacher-assign',
              name: 'TeacherAssign',
              component : TeacherAssign
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
        },
        {
          path: 'results',
          name: 'Results',
          component: Results
        },
        {
          path: 'enrollment',
          component: Enrollment,
          children: [
            {
              path: 'enroll',
              name: 'enroll',
              component: Enroll
            },
            {
              path: 'pending',
              name: 'pending',
              component: Pending
            }
          ]
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
        },
        {
          path: 'distribution',
          component: Distribution,
          children: [
            {
              path: 'marks',
              name: 'marks',
              component: Marks
            },
            {
              path: 'show',
              name: 'show',
              component: Show
            }
          ]
        },
        {
          path: 'assign-marks',
          name: 'AssignMarks',
          component: AssignMarks
        }
      ]
    }
  ]
})
