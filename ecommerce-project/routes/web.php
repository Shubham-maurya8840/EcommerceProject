<?php

use App\Http\Controllers\MainController;
use App\Http\Controllers\PaymentController;
use Illuminate\Support\Facades\Route;

Route::get('/',[MainController::class,'index']);
Route::get('/shop',[MainController::class,'shop']);
Route::get('/cart',[MainController::class,'cart']);
Route::get('/deleteCartItem/{id}',[MainController::class,'deleteCartItem']);
Route::get('/single/{id}',[MainController::class,'singleProduct']);
Route::get('/register',[MainController::class,'register']);
Route::post('/registerUser',[MainController::class,'registerUser']);
Route::post('/addToCart',[MainController::class,'addToCart']);
Route::post('/updateCart',[MainController::class,'updateCart']);
Route::get('/login',[MainController::class,'login']);
Route::post('/checkout',[MainController::class,'checkout']);
Route::get('/logout',[MainController::class,'logout']);
Route::post('/loginUser',[MainController::class,'loginUser']);
Route::controller(PaymentController::class)->group(function(){

    Route::get('stripe', 'stripe');

    Route::post('stripe', 'stripePost')->name('stripe.post');

});