<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="col-md-3 location">
                    <h4>location</h4>
                    <p>#04 Dist.City,State,PK</p>
                    <h4>hours</h4>
                    <p>Weekdays 7 a.m.-7 p.m.</p>
                    <p>Weekends 8 a.m.-7 p.m.</p>
                    <p>Call for Holidays Hours.</p>
                </div>
                <div class="col-md-3 customer">
                    <h4>customer service</h4>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod. </p>
                    <h4>phone</h4>
                    <h6>1(234)567-8910</h6>
                    <h4>contact us</h4>
                    <h6>contact us page.</h6>
                </div>
                <div class="col-md-3 social">
                    <h4>get social</h4>
                    <div class="face-b">
                        <img src="/res/site/images/foot.png" title="name"/>
                        <a href="#"><i class="fb"> </i></a>
                    </div>
                    <div class="twet">      
                        <img src="/res/site/images/foot.png" title="name"/>
                            <a href="#"><i class="twt"> </i></a>
                    </div>  
                </div>
                <div class="col-md-3 sign">
                    <h4>sign up for news later</h4> 
                        <form>
                        <input type="text" class="text" value="YOUR EMAIL" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YOUR EMAIL ';}">
                        </form>
                </div>
                    <div class="clearfix"> </div>
            </div>
            <div class="footer-bottom">
                <p>Template by <a href="" target="_blank"> w3layouts</a></p>
            </div>
        </div>
    </div>

     

    <script src="/res/site/js/handlebars-v4.0.10.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- Slider -->
    
    <script>
        $(function(){

            if (scripts instanceof Array) {

                $.each(scripts, function(index, fn){

                    if (typeof fn === 'function') fn();

                });
            }

        });
    </script>
    <!-- /footer -->
    </body>
</html>