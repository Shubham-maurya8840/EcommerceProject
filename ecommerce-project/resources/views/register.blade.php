<x-header />

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6 mx-auto">
                    <h2 class="text-center">Register Here</h2><br>
                    <div class="contact__form">
                        <form action="{{URL::to('/registerUser')}}" method="post" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="text" name="name" placeholder="FullName">
                                </div>
                                <div class="col-lg-12">
                                    <input type="text" name="email" placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                    <input type="file" name="picture">
                                </div>
                                <div class="col-lg-12">
                                     <input type="text" name="password" placeholder="Password">
                                    <button type="submit" class="site-btn">Register</button>
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