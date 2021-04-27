<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Course;
use App\Models\Section;
use App\Models\Session;
use DB;

class AdminController extends Controller
{
    public function createTeacher(Request $request){
        $obj = new User();
        $obj->name = $request->name;
        $obj->email = $request->email;
        $obj->password = md5($request->password);
        $obj->role = $request->role;
        if($obj->save()){
            return response() -> json([
                'data' => $obj,
                'msg' => 'Teacher Successfully inserted'
            ]);
        }
    }
    public function createStudent(Request $request){
        $obj = new User();
        $obj->name = $request->name;
        $obj->email = $request->email;
        $obj->password = md5($request->password);
        $obj->role = $request->role;
        if($obj->save()){
            return response() -> json([
                'data' => $obj,
                'msg' => 'Student Successfully inserted'
            ]);
        }
    }
    public function createCourse(Request $request){
        $obj = new Course();
        $obj->name = $request->name;
        $obj->code = $request->code;
        $obj->credit = $request->credit;
        $obj->type = $request->type;
        $obj->semester = $request->sem;
        if($obj->save()){
            return response() -> json([
                'data' => $obj,
                'msg' => 'Course Successfully inserted'
            ]);
        }
    }
    public function createSection(Request $request){
        $obj = new Section();
        $obj->name = $request->name;
        $obj->semester = $request->sem;
        if($obj->save()){
            return response() -> json([
                'data' => $obj,
                'msg' => 'Section Successfully inserted'
            ]);
        }
    }
    public function createSession(Request $request){
        $obj = new Session();
        $obj->name = $request->name;
        $obj->status = $request->status;
        if($obj->save()){
            return response() -> json([
                'data' => $obj,
                'msg' => 'Session Successfully inserted'
            ]);
        }
    }
    
}
