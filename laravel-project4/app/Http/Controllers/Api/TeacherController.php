<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Teacher_assign;
use App\Models\Session;
use App\Models\Course;
use App\Models\Section;
use App\Models\Num_dist;
use App\Models\Enrollment;
use App\Models\Marks_assign;
use App\Models\User;
use DB;

class TeacherController extends Controller
{
#<start> For Marks Distribution-------------------------------------------------------------
    public function getSession($id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $session = DB::table('teacher_assigns')
                    ->join('sessions', 'teacher_assigns.session_id', '=', 'sessions.id')
                    ->where('teacher_assigns.teacher_id', '=', $id)
                    ->where('teacher_assigns.status', '=', 0)
                    ->select('sessions.id', 'sessions.name')
                    ->distinct()
                    ->get();

        return response()->json([
            'session'=> $session,
            'msg' => 'success'
        ]);
    }
    public function getCourse(Request $r, $id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $t_id = $id;
        $s_id = $r->session_id;
        $course = DB::table('teacher_assigns')
                    ->join('courses', 'teacher_assigns.course_id', '=', 'courses.id')
                    ->where('teacher_assigns.teacher_id', '=', $t_id)
                    ->where('teacher_assigns.session_id', '=', $s_id)
                    ->where('teacher_assigns.status', '=', 0)
                    ->select('courses.id', 'courses.name')
                    ->distinct()
                    ->get();

        return response()->json([
            'course'=> $course,
            'msg' => 'success'
        ]);
    }
    public function getSection(Request $r, $id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $t_id = $id;
        $c_id = $r->course_id;
        $s_id = $r->session_id;
        $section = DB::table('teacher_assigns')
                    ->join('sections', 'teacher_assigns.section_id', '=', 'sections.id')
                    ->where('teacher_assigns.teacher_id', '=', $t_id)
                    ->where('teacher_assigns.session_id', '=', $s_id)
                    ->where('teacher_assigns.course_id', '=', $c_id)
                    ->where('teacher_assigns.status', '=', 0)
                    ->select('sections.id', 'sections.name')
                    ->get();

        return response()->json([
            'section'=> $section,
            'msg' => 'success'
        ]);
    }
    public function createDistribution(Request $r){ 
        foreach($r->sections_id as $section_id) {
            $obj1 = DB::table('teacher_assigns')
                    ->where('teacher_assigns.teacher_id', '=', $r->teacher_id)
                    ->where('teacher_assigns.session_id', '=', $r->session_id)
                    ->where('teacher_assigns.course_id', '=', $r->course_id)
                    ->where('teacher_assigns.section_id', '=', $section_id)
                    ->update(['status' => 1]);
            foreach($r->categories as $cat) {
                $obj2 = new Num_dist();
                $obj2->course_id     = $r->course_id ;
                $obj2->teacher_id    = $r->teacher_id ;
                $obj2->section_id    = $section_id ;
                $obj2->session_id    = $r->session_id ;
                $obj2->catagory_name = $cat['name'] ;
                $obj2->marks         = $cat['value'] ;
                $obj2->save();
            }
        }
        return response()->json([
            'fg' => '1',
            'msg' => 'success'
        ]);
    }
#<end>------------------------------------------------------------------------------------------
#<start> For Show Distribution------------------------------------------------------------------
    public function getDistribution($id){ 
        // SELECT * FROM `num_dist` WHERE teacher_id = $teacher_id
        $distList = DB::table('num_dists')
                    ->join('sessions', 'num_dists.session_id', '=', 'sessions.id')
                    ->join('sections', 'num_dists.section_id', '=', 'sections.id')
                    ->join('courses', 'num_dists.course_id', '=', 'courses.id')
                    ->where('num_dists.teacher_id', '=', $id)
                    ->select('sessions.name as Session', 'sections.name as Section', 'courses.name as Course Title', 'num_dists.catagory_name as Category Name', 'num_dists.marks as Marks')
                    ->get();

        for ($i=1; $i<=count($distList);$i++) {
            $distList[$i-1]->SN = $i; 
        }
        
        return response()->json([
            'distList'=> $distList,
            'msg' => 'success'
        ]);
    }
#<end>------------------------------------------------------------------------------------------
#<start> For Assign Marks-----------------------------------------------------------------------
    public function getDistSession($id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $session = DB::table('teacher_assigns')
                    ->join('sessions', 'teacher_assigns.session_id', '=', 'sessions.id')
                    ->where('teacher_assigns.teacher_id', '=', $id)
                    ->where('teacher_assigns.status', '=', 1)
                    ->select('sessions.id', 'sessions.name')
                    ->distinct()
                    ->get();

        return response()->json([
            'session'=> $session,
            'msg' => 'success'
        ]);
    }
    public function getDistCourse(Request $r, $id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $t_id = $id;
        $s_id = $r->session_id;
        $course = DB::table('teacher_assigns')
                    ->join('courses', 'teacher_assigns.course_id', '=', 'courses.id')
                    ->where('teacher_assigns.teacher_id', '=', $t_id)
                    ->where('teacher_assigns.session_id', '=', $s_id)
                    ->where('teacher_assigns.status', '=', 1)
                    ->select('courses.id', 'courses.name')
                    ->distinct()
                    ->get();

        return response()->json([
            'course'=> $course,
            'msg' => 'success'
        ]);
    }
    public function getDistSection(Request $r, $id){ 
        // SELECT DISTINCT `session_id` FROM `teacher_assign` WHERE teacher_id = $teacher_id AND `status` = 0";
        // "SELECT * FROM `sessions` WHERE id = $session_id";
        $t_id = $id;
        $c_id = $r->course_id;
        $s_id = $r->session_id;
        $section = DB::table('teacher_assigns')
                    ->join('sections', 'teacher_assigns.section_id', '=', 'sections.id')
                    ->where('teacher_assigns.teacher_id', '=', $t_id)
                    ->where('teacher_assigns.session_id', '=', $s_id)
                    ->where('teacher_assigns.course_id', '=', $c_id)
                    ->where('teacher_assigns.status', '=', 1)
                    ->select('sections.id', 'sections.name')
                    ->get();

        return response()->json([
            'section'=> $section,
            'msg' => 'success'
        ]);
    }
    public function getTeacherDist(Request $r, $id){ 
        $t_id = $id;
        $c_id = $r->course_id;
        $s_id = $r->session_id;
        $sec_id = $r->section_id;
        $obj = DB::table('num_dists')
                 ->where('num_dists.teacher_id', '=', $t_id)
                 ->where('num_dists.session_id', '=', $s_id)
                 ->where('num_dists.course_id', '=', $c_id)
                 ->where('num_dists.section_id', '=', $sec_id)
                 ->select('num_dists.id as id', 'num_dists.catagory_name as name', 'num_dists.marks')
                 ->get();
    
        $obj1 = DB::table('enrollments')
                 ->join('users', 'users.id', 'enrollments.student_id')
                 ->join('marks_assigns', 'users.id', 'marks_assigns.student_id')
                 ->where('enrollments.teacher_id', '=', $t_id)
                 ->where('marks_assigns.teacher_id', '=', $t_id)
                 ->where('enrollments.session_id', '=', $s_id)
                 ->where('marks_assigns.session_id', '=', $s_id)
                 ->where('enrollments.course_id', '=', $c_id)
                 ->where('marks_assigns.course_id', '=', $c_id)
                 ->where('enrollments.section_id', '=', $sec_id)
                 ->where('marks_assigns.section_id', '=', $sec_id)
                 ->select('marks_assigns.id as id', 'users.id as student_id', 'users.name as name', 'marks_assigns.dist_id', 'marks_assigns.marks')
                 ->get();
                 
        $obj2 = DB::table('marks_assigns')
                 ->where('marks_assigns.teacher_id', '=', $t_id)
                 ->where('marks_assigns.session_id', '=', $s_id)
                 ->where('marks_assigns.course_id', '=', $c_id)
                 ->where('marks_assigns.section_id', '=', $sec_id)
                 ->select('marks_assigns.student_id as student_id')
                 ->distinct()
                 ->get();

        $data = [];
        $i = 0;
        foreach($obj2 as $j) {
            $total=0;
            // $fg=1;
            $cnt=0;
            foreach($obj1 as $k) {
                if($j->student_id == $k->student_id) {
                    $data[$i]['i'] = $i;
                    $data[$i]['id'] = $j->student_id;
                    $data[$i]['name'] = $k->name;
                    $data[$i]['marks'][$cnt]['id'] = $k->id;
                    $data[$i]['marks'][$cnt]['numbers'] = $k->marks;
                    $total += $k->marks;
                    $cnt++;
                }
            }
            $data[$i]['total'] = $total;
            $i++;
        } 
        
        return response()->json([
            'obj'=> $obj,
            'list'=> $data,
            'msg' => 'success'
        ]);
    }
    public function updateStdMarks(Request $r){
        for($i=0; $i <count($r->ids) ;$i++) {
            $obj = DB::table('marks_assigns')
                    ->where('marks_assigns.id', '=', $r->ids[$i])
                    ->update(['marks' => $r->marks[$i]]);
        }
        return response()->json([
            'msg' => 'success'
        ]);
    }
}
