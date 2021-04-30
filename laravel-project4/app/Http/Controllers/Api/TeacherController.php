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
#<start> For Show Distribution-------------------------------------------------------------
    public function getDistribution($id){ 
        // SELECT * FROM `num_dist` WHERE teacher_id = $teacher_id
        $distList = DB::table('num_dists')
                    ->join('sessions', 'num_dists.session_id', '=', 'sessions.id')
                    ->join('sections', 'num_dists.section_id', '=', 'sections.id')
                    ->join('courses', 'num_dists.course_id', '=', 'courses.id')
                    ->where('num_dists.teacher_id', '=', $id)
                    ->select('num_dists.id', 'sessions.name as session_name', 'sections.name as section_name', 'courses.name as course_name', 'num_dists.catagory_name', 'num_dists.marks')
                    ->get();

        return response()->json([
            'distList'=> $distList,
            'msg' => 'success'
        ]);
    }
#<end>------------------------------------------------------------------------------------------
}
