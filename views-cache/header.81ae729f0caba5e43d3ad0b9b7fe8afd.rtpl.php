<?php if(!class_exists('Rain\Tpl')){exit;}?><!DOCTYPE HTML>
<html>
    <head>
        <title>Casa de Dona Brasilina</title>
        <link rel="icon" type="image/png" href="/res/site/images/logo2.fw.png" />
        <link href="/res/site/css2/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/res/site/js2/jquery.min.js"></script>

        <link rel="stylesheet" href="/res/site/css/bootstrap.min.css">
         <!-- Custom Theme files -->
        <link href="/res/site/css2/style.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="/res/site/css/style.css">
         <!-- Custom Theme files -->
         <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        </script>

        <script>function CompararData(){ campodata = document.checkout.data.value datdahoje = document.F1.hoje.value var result = true; if (campodata >= datahoje) result = false; else alert("A data informada é Retroativa...\nInforme uma data Valida")}</script>


        <script src="/res/site/js2/jquery.easydropdown.js"></script>
        <!----webfonts--->
        <link 
href='https://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600' rel='stylesheet' type='text/css'>
        <!---//webfonts--->
        <script src="/res/site/js2/jquery.min.js"></script>
        <script type="text/javascript" src="/res/site/js2/move-top.js"></script>
        <script type="text/javascript" src="/res/site/js2/easing.js"></script>
        <link rel="stylesheet" href="/res/site/css2/etalage.css">
        <link href="/res/site/css2/form.css" rel="stylesheet" type="text/css" media="all" />
        <script src="/res/site/js2/jquery.easydropdown.js"></script>

        <script src="/res/site/js2/jquery.etalage.min.js"></script>
<script>
            jQuery(document).ready(function($){

                $('#etalage').etalage({
                    thumb_image_width: 300,
                    thumb_image_height: 400,
                    source_image_width: 800,
                    source_image_height: 1000,
                    show_hint: true,
                    click_callback: function(image_anchor, instance_id){
                        alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
                    }
                });

            });
        </script>

        <script>
                        $( "span.menu" ).click(function() {
                          $( ".head-nav ul" ).slideToggle(300, function() {
                            // Animation complete.
                          });
                        });
                    </script>

         <script type="text/javascript">
        window.scripts = [];
    </script>
        <!----webfonts--->
        <link 
href='https://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600' rel='stylesheet' type='text/css'>
        <!---//webfonts--->
    </head>
    <body>
    <!-- container -->
        <!-- top-header -->
        <div class="top-header">
            <div class="container">
                <div class="top-header-left">
                     <ul>
                        <li><a href="/profile">Minha Conta</a></li>
                        <li><a href="">Contato</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="top-header-center">
                    <p><a href="/cart" style="color: #ffffff"><span class="cart"> </span>Carrinho<label>R$ <?php echo getCartVlSubtotal(); ?></label></a></p>
                </div>
                <div class="top-header-right">
                    <ul>
                        <?php if( checkLogin(false) ){ ?>
                            <li><a href="/profile"><i class="fa fa-user"></i> <?php echo utf8_decode(getUserName()); ?></a></li>
                            <li><a href="/logout"><i class="fa fa-close"></i> Sair</a></li>
                            <?php }else{ ?>
                            <li><a href="/login"><i class="fa fa-lock"></i> Login</a></li>
                            <li><a href="/login"><i class="fa fa-lock"></i> Criar Conta</a></li>
                            <?php } ?>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!-- /top-header -->
        <!-- main-menu -->
        <div class="main-menu">
            <div class="container">
            <div class="head-nav">
                <span class="menu"> </span>
                <ul>
                    <li><a href="/">Home</a></li>
                    
                    <li><a href="/about">Sobre</a></li>
                    <li><?php require $this->checkTemplate("categories-menu");?></li>
                    <div class="clearfix"> </div>

                </ul>
            </div>  
                <!-- script-for-nav -->
                    <script>
                        $( "span.menu" ).click(function() {
                          $( ".head-nav ul" ).slideToggle(300, function() {
                            // Animation complete.
                          });
                        });
                    </script>
                <!-- script-for-nav -->

                <!-- logo -->
                <div class="logo">
                    <a href="/"><img src="/res/site/images/logo.png"/></a>
                </div>
                <!-- logo -->
            </div>

            <!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- Your customer chat code -->
<div class="fb-customerchat"
  attribution=install_email
  page_id="723413084433714"
  theme_color="#0084ff">
</div>
        </div>
        <!-- /main-menu -->
