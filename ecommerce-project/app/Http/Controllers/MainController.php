<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{
    public function index()
    {
        $allProducts = Product::all();
        $newArrival = Product::where('type', 'new-arrivals')->get();
        $hotSale = Product::where('type', '  sale')->get();
        $bestSeller = Product::where('type', ' Best Sellers')->get();
        return view('index', compact('allProducts', 'newArrival', 'bestSeller'));
    }

    public function shop()
    {
        return view('shop');
    }

    public function cart()
    {
        $cartItems = DB::table('products')
    ->join('carts', 'products.id', '=', 'carts.productId')
    ->select(
        'products.quantity as pquantity',
        'products.title',
        'products.price',
        'products.description',
        'products.picture',
        'carts.*'
    )
    ->where('carts.customerId', session()->get('id'))
    ->get();

        return view('cart',compact('cartItems'));
    }

    public function singleProduct($id)
    {
        $product = Product::find($id);
        return view('single-product', compact('product'));
    }

    public function deleteCartItem($id)
    {
        $item = Cart::find($id);
        $item->delete();
        return redirect()->back()->with('success', 'item deleted into cart');

    }
    public function register()
    {
        return view('register');
    }

    public function registerUser(Request $request)
    {
        $user = new User;
        $user->fullName = $request->name;
        $user->email = $request->email;
        $user->password = $request->password;
        $user->picture = $request->file('picture')->getClientOriginalName();
        $request->file('picture')->move('uploads/', $user->picture);
        $user->type = 'customer';
        $user->save();
        if ($user) {
            return redirect('/login')->with('success', 'congrats you are regisyered');
        }
    }

    public function addToCart(Request $request)
    {
        $items = new Cart;
        if (session()->has('id')) {
            $items->quantity = $request->quantit;
            $items->customerId = $request->session()->get('id');
            $items->productId = $request->id;
            $items->save();
            return redirect()->back()->with('success', 'item aded into cart');
        }
        else{
            return redirect('/login')->with('error', 'Please Login ');
        }
    }

     public function checkout(Request $request)
    {
        if (session()->has('id')) {
            $order = new Order;
            $order->status = "pending";
            $order->customerId = session()->get('id');
            $order->bill = $request->bill;
            $order->name = $request->name;
            $order->phone = $request->phone;
            $order->address = $request->address;
            if($order->save()){
               $carts = Cart::where('customerId',session()->get('id'))->get();
               foreach($carts as $item){
                $orderItem = new OrderItem();
                $product = Product::find($item->productId);
                $orderItem->productId = $item->productId;
                $orderItem->quantity = $item->productId;
                $orderItem->price = $product->price;
                $orderItem->orderId = $order->id;
                $orderItem->save();
                $item->delete();
               }
               
            };
            return redirect()->back()->with('success', 'item is placed successfully');
        }
        else{
            return redirect('/login')->with('error', 'Please Login ');
        }
    }

    public function updateCart(Request $request)
    {
        if (session()->has('id')) {
            $items=Cart::find($request->id);
            $items->quantity = $request->quantity;
            $items->save();
            return redirect()->back()->with('success', 'item updated into cart');
        }
        else{
            return redirect('/login')->with('error', 'Please Login ');
        }
    }
    public function login()
    {
        return view('login');
    }
    public function loginUser(Request $request)
    {
        $user = User::where('email', $request->email)->where('password', $request->password)->first();
        if ($user) {
            session()->put('id', $user->id);
            session()->put('type', $user->type);
            if ($user->type == 'customer') {
                return redirect('/')->with('success', 'you are logging');
            }
        }
        return redirect('/login')->with('error', 'somethimg error');
    }
    public function logout()
    {
        session()->forget('id');
        session()->forget('type');
        return redirect('/login');
    }
}
