<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Session;
use App\Models\Course;
use App\Models\Section;
use App\Models\Type;
use App\Models\Teacher_assign;
use App\Models\Enrollment;
use App\Models\Num_dist;
use App\Models\Marks_assign;
use DB;

class StudentController extends Controller
{
    public function getSession(){ 
        $session = DB::table('sessions')
                    ->where('sessions.status', '=', 1)
                    ->select('sessions.id', 'sessions.name')
                    ->get();

        return response()->json([
            'session'=> $session,
            'msg' => 'success'
        ]);
    }
    public function getCourseList(){ 
        $obj = DB::table('courses')
                    ->select('courses.id', 'courses.name as crs_name', 'courses.type', 'courses.credit', 'courses.semester')
                    ->get();
        $j = 0;
        $data = [];
        foreach($obj as $i) {
            $obj1 = DB::table('sections')
                    ->join('courses', 'sections.semester', '=', 'courses.semester')
                    ->where('sections.semester', '=', $i->semester)
                    ->select('sections.id', 'sections.name as sec_name')
                    ->distinct()
                    ->get();
            $data[$j]['id'] = $i->id;
            $data[$j]['crs_name'] = $i->crs_name;
            $data[$j]['type'] = $i->type;
            $data[$j]['credit'] = $i->credit;
            $data[$j]['version'] = DB::table('types')
                    ->where('types.status', '=', 1)
                    ->select('types.id', 'types.name')
                    ->get();
            $l = 0;
            foreach($obj1 as $k) {
                $data[$j]['section'][$l]['id'] = $k->id;
                $data[$j]['section'][$l++]['name'] = $k->sec_name;
            }
            $data[$j]['check_list'] = '';
            $data[$j]['ver'] = '';
            $data[$j]['sec'] = '';
            $j++;
        }
        return response()->json([
            'list'=> $data,
            // 'list'=> $courses,
            'msg' => 'success'
        ]);
    }
    public function assignEnroll(Request $r){ 
        // $data = [];
        for($i=0; $i <count($r->course_id) ;$i++) {
            $teacher = DB::table('teacher_assigns')
                    ->where('teacher_assigns.section_id', '=', $r->section_id[$i])
                    ->where('teacher_assigns.course_id', '=', $r->course_id[$i])
                    ->where('teacher_assigns.session_id', '=', $r->session_id)
                    ->where('teacher_assigns.status', '=', '1')
                    ->select('teacher_assigns.teacher_id')
                    ->first();

            $enroll = new Enrollment();
            $enroll->student_id     = $r->student_id ;
            $enroll->course_id     = $r->course_id[$i] ;
            $enroll->type_id     = $r->type_id[$i] ;
            $enroll->section_id    = $r->section_id[$i] ;
            $enroll->teacher_id    = $teacher->teacher_id ;
            $enroll->session_id    = $r->session_id ;
            $enroll->status = 0 ;
            
            // if($enroll->save()) {
                $distribution = DB::table('num_dists')
                                ->where('num_dists.section_id', '=', $r->section_id[$i])
                                ->where('num_dists.course_id', '=', $r->course_id[$i])
                                ->where('num_dists.session_id', '=', $r->session_id)
                                ->where('num_dists.teacher_id', '=', $teacher->teacher_id)
                                ->select('num_dists.id as dist_id')
                                ->get();
                $k=0;
                foreach($distribution as $j) {
                    $assign = new Marks_assign();
                    $assign->student_id     = $r->student_id ;
                    $assign->teacher_id    = $teacher->teacher_id ;
                    $assign->course_id     = $r->course_id[$i] ;
                    $assign->section_id    = $r->section_id[$i] ;
                    $assign->session_id    = $r->session_id ;
                    $assign->dist_id    = $j->dist_id;
                    $assign->marks    = 0;
                    // $assign->save();
                    // $data[$i]['assign'][$k++] = $assign;
                }
            // }
            // $data[$i]['enroll'] = $enroll;
        }
        return response()->json([
            'flag'=> '1',
            'msg' => 'success'
        ]);
    }
    public function getPendingList(Request $r, $id){ 
        $list = DB::table('enrollments')
                    ->join('courses', 'enrollments.course_id', '=', 'courses.id')
                    ->join('sections', 'enrollments.section_id', '=', 'sections.id')
                    ->join('types', 'enrollments.type_id', '=', 'types.id')
                    ->where('enrollments.student_id', '=', $id)
                    ->where('enrollments.session_id', '=', $r->session_id)
                    ->select('courses.name as Course Title', 'courses.credit as Credit', 'sections.name as Section', 'types.name as Type', 'enrollments.status as st')
                    ->get();
        $k = 1;
        foreach($list as $i) {
            $i->SN = $k++;
            if($i->st == 0) { $i->Status = "Pending"; }
            else if($i->st == 1) { $i->Status = "Approved"; }
            else { $i->Status = "Rejected"; }
        }
        return response()->json([
            'list'=> $list,
            'msg' => 'success'
        ]);
    }
}
