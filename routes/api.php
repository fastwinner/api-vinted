<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ArticleController;
use App\Http\Controllers\UserController;

Route::get('/articles', [ArticleController::class,'index']);
Route::post('/articles', [ArticleController::class,'store']);
Route::get('/articles/{id}', [ArticleController::class,'show']);
Route::put('/articles/{id}', [ArticleController::class,'update']);
Route::delete('/article/{id}', [ArticleController::class,'destroy']);

Route::apiResource('users', UserController::class);



use App\Http\Controllers\ConnexionController;

Route::post('/register', [ConnexionController::class, 'register']);
Route::post('/login', [ConnexionController::class, 'login']);
Route::post('/logout', [ConnexionController::class, 'logout'])->middleware('auth:sanctum');
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
