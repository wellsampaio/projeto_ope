<?php if(!class_exists('Rain\Tpl')){exit;}?><!DOCTYPE HTML>
<html>
    <head>
        <title>Sweet-cakes Website Template | Home :: w3layouts</title>
        <link href="/res/site/css2/bootstrap.css" rel='stylesheet' type='text/css' />
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="/res/site/js2/jquery.min.js"></script>
         <!-- Custom Theme files -->
        <link href="/res/site/css2/style.css" rel='stylesheet' type='text/css' />
        <link rel="stylesheet" href="/res/site/css/style.css">
         <!-- Custom Theme files -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        </script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700,800,400,600' rel='stylesheet' type='text/css'>
        <!---//webfonts--->
    </head>
    <body>
    <!-- container -->
        <!-- top-header -->
        <div class="top-header">
            <div class="container">
                <div class="top-header-left">
                    <ul>
                        <li><a href="myaccount.html">My Account</a></li>
                        <li><a href="checkout.html">Checkout</a></li>
                        <div class="clearfix"> </div>
                    </ul>
                </div>
                <div class="top-header-center">
                    <p><span class="cart"> </span>Cart<label>$5256</label></p>
                </div>
                <div class="top-header-right">
                    <ul>
                        <?php if( checkLogin(false) ){ ?>
                            <li><a href="/profile"><i class="fa fa-user"></i> <?php echo getUserName(); ?></a></li>
                            <li><a href="/logout"><i class="fa fa-close"></i> Sair</a></li>
                            <?php }else{ ?>
                            <li><a href="/login"><i class="fa fa-lock"></i> Login</a></li>
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
                    <li class="active"><a href="/">Home</a></li>
                    
                    <li><a href="about.html">about</a></li>
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
                    <a href="/"><img src="/res/site/images/logo.png" title="Sweetcake" /></a>
                </div>
                <!-- logo -->
            </div>
        </div>
        <!-- /main-menu -->