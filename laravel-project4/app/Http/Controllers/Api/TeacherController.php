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
                    ->select('num_dists.id as id', 'sessions.name as session_name', 'sections.name as section_name', 'courses.name as course_name', 'num_dists.catagory_name', 'num_dists.marks')
                    ->get();

        for ($i=1; $i<=count($distList);$i++) {
            $distList[$i-1]->id = $i; 
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
        
        // $teacher_id = $_SESSION['id'];
        // $course_id = $_REQUEST['course_id'];
        // $section_id = $_REQUEST['section_id'];
        // $session_id = $_REQUEST['session_id'];
        // $query = "SELECT users.name, student_id FROM enrollment, users WHERE course_id=$course_id AND section_id=$section_id AND teacher_id=$teacher_id AND session_id=$session_id AND status=1 AND users.id = enrollment.student_id";
        // // echo $query;
        // $sql = mysqli_query($conn, $query);
        // $data = [];
        // $i = 0;
        // while($row = mysqli_fetch_array($sql))
        // {
        //     $student_id = $row['student_id'];
        //     $data[$i]['name'] = $row['name'];
        //     $data[$i]['student_id'] = $student_id;
    
        //     $query1 = "SELECT dist_id, marks FROM marks_assign WHERE marks_assign.student_id = $student_id AND marks_assign.teacher_id = $teacher_id AND marks_assign.course_id = $course_id AND marks_assign.section_id = $section_id AND marks_assign.session_id = $session_id";
        //     $sql1 = mysqli_query($conn, $query1);
        //     $flag = true;
        //     $j = 0;
        //     while($row1 = mysqli_fetch_array($sql1)){
        //         $dist_id = $row1['dist_id'];
        //         if($flag) { $data[$i]['begin'] = $dist_id; $flag = false; }
        //         else { $data[$i]['end'] = $dist_id; }
        //         $marks = $row1['marks'];
        //         $data[$i][$j] = $marks; 
        //         $j++;
        //     }   
        //     $i++;
        // }
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
            $fg=1;
            $cnt=0;
            foreach($obj1 as $k) {
                if($j->student_id == $k->student_id) {
                    if($fg) {
                        $data[$i]['id_begin'] = $k->id;
                        $fg^=1;
                    }
                    else { $data[$i]['id_end'] = $k->id; }

                    $data[$i]['i'] = $i;
                    $data[$i]['id'] = $j->student_id;
                    $data[$i]['name'] = $k->name;
                    $data[$i]['marks'][$cnt++] = (string)$k->marks;

                }
                // else break;
            }
            $i++;
        } 
        
        return response()->json([
            'obj'=> $obj,
            'list'=> $data,
            'msg' => 'success'
        ]);
    }
}
