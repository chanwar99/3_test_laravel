<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProjectController;

// use App\Http\Controllers\Register;
// use App\Http\Controllers\Article;
// use App\Http\Controllers\Process;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [ProjectController::class, 'index'])->name('project.index');
Route::get('/get-data', [ProjectController::class, 'getData'])->name('project.getData');
Route::post('/', [ProjectController::class, 'store'])->name('project.store');
Route::get('/{project_id}/edit', [ProjectController::class, 'edit'])->name('project.edit'); // fetch
Route::put('/{project_id}', [ProjectController::class, 'update'])->name('project.update');
Route::delete('/', [ProjectController::class, 'destroy'])->name('project.destroy');