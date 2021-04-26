<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
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
}
