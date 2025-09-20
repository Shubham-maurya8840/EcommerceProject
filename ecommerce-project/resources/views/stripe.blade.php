<!DOCTYPE html>
<html>
<head>
    <title>Stripe Payment - Laravel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://js.stripe.com/v3/"></script>

    <style>
        .credit-card-box {
            margin-top: 50px;
            border: 1px solid #ddd;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        #card-element {
            background: white;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        #submit {
            margin-top: 20px;
        }
        .StripeElement--focus {
            border-color: #66afe9;
            box-shadow: 0 0 8px rgba(102,175,233,.6);
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center">Laravel - Stripe Payment Gateway</h2>

    <div class="row justify-content-center">
        <div class="col-md-6 col-md-offset-3">
            <div class="credit-card-box">
                <h3 class="panel-title text-center">Payment Details</h3>
                <hr>

                <form id="payment-form">
                    <div class="form-group">
                        <label for="card-element">Card Details</label>
                        <div id="card-element"><!-- Stripe Card Element will be inserted here --></div>
                    </div>

                    <div id="error-message" class="text-danger mt-2"></div>

                    <button id="submit" class="btn btn-primary btn-lg btn-block">
                        Pay Now (${{ $bill }})
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const stripe = Stripe("{{ $stripeKey }}");
    const elements = stripe.elements();

    const cardElement = elements.create('card', {
        style: {
            base: {
                fontSize: '16px',
                color: '#32325d',
                '::placeholder': { color: '#aab7c4' }
            },
            invalid: { color: '#fa755a' }
        }
    });
    cardElement.mount('#card-element');

    const form = document.getElementById('payment-form');
    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const {error, paymentIntent} = await stripe.confirmCardPayment(
            "{{ $clientSecret }}",
            { payment_method: { card: cardElement } }
        );

        if (error) {
            document.getElementById('error-message').textContent = error.message;
        } else if (paymentIntent.status === 'succeeded') {
            alert("✅ Payment successful!");
            window.location.href = "/"; // redirect as needed
        }
    });
</script>
</body>
</html>
