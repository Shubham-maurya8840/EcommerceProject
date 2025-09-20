<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session as FacadesSession;
use Stripe\Stripe;
use Stripe\Charge;

class PaymentController extends Controller
{
    public function stripe(Request $request)
    {
        $bill = $request->bill;
        $phone = $request->phone;
        $address = $request->address;
        $name = $request->name;

        return view('stripe', compact('bill','name','phone','address'));
    }

   public function stripePost(Request $request)
{
    \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

    $paymentIntent = \Stripe\PaymentIntent::create([
    'amount' => $request->bill * 100,
    'currency' => 'usd',
    'automatic_payment_methods' => [
        'enabled' => true,
        'allow_redirects' => 'never', // 🚫 redirect wali payment methods block ho jayengi
    ],
]);
  $clientSecret = $paymentIntent->client_secret;

        // return view('stripe', [
        //     'bill' => $request->bill,
        //     'clientSecret' => $clientSecret,
        //     'stripeKey' => env('STRIPE_KEY'),
        // ]);

         if (session()->has('id')) {
            $order = new Order;
            $order->status = "success";
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
            return redirect('/cart')->with('success', 'item is placed successfully');
        }
    }

}
