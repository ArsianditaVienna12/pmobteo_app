<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PetController;
use App\Http\Controllers\AdoptionController;
use App\Http\Controllers\FavoriteController;

// Public routes (TANPA AUTH)
Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);

Route::middleware('auth:sanctum')->group(function () {
    Route::get('/profile', [AuthController::class, 'profile']);
    Route::get('/pets', ...); // yang udah ada
});

// Protected routes
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', [AuthController::class, 'user']);
    Route::post('/logout', [AuthController::class, 'logout']);
    
    Route::get('/pets', [PetController::class, 'index']);
    Route::get('/pets/{id}', [PetController::class, 'show']);
    
    Route::get('/adoptions', [AdoptionController::class, 'index']);
    Route::post('/adoptions', [AdoptionController::class, 'store']);
    
    Route::get('/favorites', [FavoriteController::class, 'index']);
    Route::post('/favorites/{petId}', [FavoriteController::class, 'toggle']);
    
});