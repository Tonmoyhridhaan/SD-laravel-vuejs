<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Teacher_assign;
use App\Models\Session;
use App\Models\Course;
use App\Models\Section;
use App\Models\Num_dist;
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
            foreach($r->categories as $cat) {
                $obj = new Num_dist();
                $obj->course_id     = $r->course_id ;
                $obj->teacher_id    = $r->teacher_id ;
                $obj->section_id    = $section_id ;
                $obj->session_id    = $r->session_id ;
                $obj->catagory_name = $cat['name'] ;
                $obj->marks         = $cat['value'] ;
                $obj->save();
            }
        }
        return response()->json([
            'msg' => 'success'
        ]);
    }
#<end>------------------------------------------------------------------------------------------
}
