<x-header />

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 mx-auto">
                    <h2 class="text-center">Login Here</h2><br>
                    <div class="contact__form">
                           @if (session()->has('success'))
                                <div class="alert alert-success">
                                    <p>{{session()->get('success')}}</p>
                                </div>
                            
                            @endif
                             @if (session()->has('error'))
                                <div class="alert alert-danger">
                                    <p>{{session()->get('error')}}</p>
                                </div>
                            
                            @endif
                        <form action="{{URL::to('/loginUser')}}" method="post">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="text" name="email" placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                     <input type="password" name="password" placeholder="Password">
                                    <button type="submit" name="submit" class="site-btn">Login</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->

    <x-footer />