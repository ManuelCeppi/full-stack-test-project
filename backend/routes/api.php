<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::prefix('/test')->group(function () {
    Route::get('/healthcheck', function (Request $request) {
        echo "App is running!";
    });
    Route::get('/user', function (Request $request) {
        return $request->user();
    })->middleware('auth:sanctum');
});