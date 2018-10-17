<?php if(!class_exists('Rain\Tpl')){exit;}?>    <!-- service -->
<div class="biseller-info">
<div class="container">
<h2>Products</h2>
<h3 class="new-models">new varieties</h3>
            <ul id="flexiselDemo3">
                <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>
                <li>
                    <div class="biseller-column">
                    <img src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" alt="" class="veiw-img">
                        <div class="veiw-img-mark">
                            <a href="singlepage.html">Quick view</a>
                        </div>
                    <div class="biseller-name">
                        <h4><?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?></h4>
                        <p>R$ <?php echo formatPrice($value1["vlprice"]); ?></p>
                    </div>
                        <a href="/cart/<?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/add"><button class="add2cart">
                            <span>| Add to Cart</span>
                        </button></a>                   
                    </div>
                </li>
                <?php } ?>
                
                
            </ul>
            </div>
        </div>  

            <script type="text/javascript">
                 $(window).load(function() {
                    $("#flexiselDemo3").flexisel({
                        visibleItems: 4,
                        animationSpeed: 1000,
                        autoPlay: false,
                        autoPlaySpeed: 3000,            
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: { 
                            portrait: { 
                                changePoint:480,
                                visibleItems: 1
                            }, 
                            landscape: { 
                                changePoint:640,
                                visibleItems: 2
                            },
                            tablet: { 
                                changePoint:768,
                                visibleItems: 3
                            }
                        }
                    });
                    
                });
               </script>
               <script type="text/javascript" src="/res/site/js2/jquery.flexisel.js"></script>
            
                <div class="best-seller">
                <div class="container">
                    <div class="biseller-info">
                     <h3 class="new-models">varieties</h3>
                    <ul id="flexiselDemo1">
                        <?php $counter1=-1;  if( isset($products) && ( is_array($products) || $products instanceof Traversable ) && sizeof($products) ) foreach( $products as $key1 => $value1 ){ $counter1++; ?>
                        <li>
                            <div class="biseller-column">
                            <img src="<?php echo htmlspecialchars( $value1["desphoto"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" alt="">
                            <div class="veiw-img-mark">
                            <a href="singlepage.html">Quick view</a>
                        </div>
                    <div class="biseller-name">
                        <h4><?php echo htmlspecialchars( $value1["desproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?> </h4>
                        <p>R$ <?php echo formatPrice($value1["vlprice"]); ?></p>
                    </div>
                        <a href="/cart/<?php echo htmlspecialchars( $value1["idproduct"], ENT_COMPAT, 'UTF-8', FALSE ); ?>/add"><button class="add2cart">
                            <span>| Add to Cart</span>
                        </button></a>
                            </div>
                        </li>
                        <?php } ?>
                    </ul>
                    </div>
            </div>
            </div>
            <script type="text/javascript">
                 $(window).load(function() {
                    $("#flexiselDemo1").flexisel({
                        visibleItems: 4,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,            
                        pauseOnHover: true,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: { 
                            portrait: { 
                                changePoint:480,
                                visibleItems: 1
                            }, 
                            landscape: { 
                                changePoint:640,
                                visibleItems: 2
                            },
                            tablet: { 
                                changePoint:768,
                                visibleItems: 3
                            }
                        }
                    });
                    
                });
               </script>
               <script type="text/javascript" src="/res/site/js2/jquery.flexisel.js"></script>
            
            <div class="clearfix"></div>