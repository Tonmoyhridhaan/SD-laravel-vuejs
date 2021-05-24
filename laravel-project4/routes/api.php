<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\TeacherController;
use App\Http\Controllers\Api\StudentController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

#to login
Route::post('/store-login', [AuthController::class, 'storeLogin']);
Route::get('get-user/{id}', [AuthController::class, 'getUserById']);

//Admin :--------------------------------------------------------------

#creation:
    Route::post('create-teacher', [AdminController::class, 'createTeacher']);
    Route::post('create-student', [AdminController::class, 'createStudent']);
    Route::post('create-course', [AdminController::class, 'createCourse']);
    Route::post('create-section', [AdminController::class, 'createSection']);
    Route::post('create-session', [AdminController::class, 'createSession']);

#manage
    Route::get('get-session', [AdminController::class, 'getSession']);
    Route::post('update-session', [AdminController::class, 'updateSession']);
    Route::get('get-type', [AdminController::class, 'getType']);
    Route::post('update-type', [AdminController::class, 'updateType']);
    Route::get('get-enrollment', [AdminController::class, 'getEnrollment']);
    Route::post('update-enrollment', [AdminController::class, 'updateEnrollment']);


//Teacher :---------------------------------------------------------------

#Distribution
    Route::get('get-assigned-teacher-session/{id}', [TeacherController::class, 'getSession']);
    Route::post('get-assigned-teacher-course/{id}', [TeacherController::class, 'getCourse']);
    Route::post('get-assigned-teacher-section/{id}', [TeacherController::class, 'getSection']);
    Route::post('create-distribution', [TeacherController::class, 'createDistribution']);
    Route::get('get-assigned-distribution/{id}', [TeacherController::class, 'getDistribution']);
#AssignMarks
    Route::get('get-assigned-dist-teacher-session/{id}', [TeacherController::class, 'getDistSession']);
    Route::post('get-assigned-dist-teacher-course/{id}', [TeacherController::class, 'getDistCourse']);
    Route::post('get-assigned-dist-teacher-section/{id}', [TeacherController::class, 'getDistSection']);
    Route::post('get-assigned-dist-teacher/{id}', [TeacherController::class, 'getTeacherDist']);
    Route::post('update-student-marks', [TeacherController::class, 'updateStdMarks']);


//Student :---------------------------------------------------------------

#Enrollment
Route::get('get-open-sessions', [StudentController::class, 'getSession']);
Route::get('get-course-list', [StudentController::class, 'getCourseList']);
Route::post('assign-enroll', [StudentController::class, 'assignEnroll']);
Route::post('get-pending-list/{id}', [StudentController::class, 'getPendingList']);