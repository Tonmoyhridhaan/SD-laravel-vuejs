<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\AdminController;
use App\Http\Controllers\Api\TeacherController;

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


//Teacher :---------------------------------------------------------------

#Distribution
    Route::get('get-assigned-teacher-session/{id}', [TeacherController::class, 'getSession']);
    Route::post('get-assigned-teacher-course/{id}', [TeacherController::class, 'getCourse']);
    Route::post('get-assigned-teacher-section/{id}', [TeacherController::class, 'getSection']);
    Route::post('create-distribution', [TeacherController::class, 'createDistribution']);


//Student :---------------------------------------------------------------