<?php if(!class_exists('Rain\Tpl')){exit;}?><!-- footer -->
    <div class="footer">
        <div class="container">
            <div class="footer-top">
                <div class="col-md-3 location">
                    <h4>Localização</h4>
                    <p>Rua Irapuru, 00 - Freguesia do Ó - SP, 02960070</p>
                    <h4>Horário de Atendimento</h4>
                    <p>08:00 ás 18:00</p>
                    <p>De Segunda a Sábado</p>
                </div>
                <div class="col-md-3 social">
                    <h4>Rede Social</h4>
                    <div class="face-b">
                        <img src="/res/site/images/logo - Copia.png" title="name"/>
                        <a href="https://www.facebook.com/casadedonabrasilina/" target="_blank"><i class="fb"> </i></a>
                    </div>
                    <!--<div class="twet">      
                        <img src="/res/site/images/foot.png" title="name"/>
                            <a href="#"><i class="twt"> </i></a>
                    </div>-->  
                </div>
                <!--<div class="col-md-3 sign">
                    <h4>sign up for news later</h4> 
                        <form>
                        <input type="text" class="text" value="YOUR EMAIL" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'YOUR EMAIL ';}">
                        </form>
                </div>-->
                    <div class="clearfix"> </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; Casa de Dona Brasilina.<a href="http://www.casadedonabrasilina.com.br" target="_blank"> www.casadedonabrasilina.com.br</a></p>
            </div>
        </div>
    </div>

     

    <script src="/res/site/js/handlebars-v4.0.10.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script 
src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
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
