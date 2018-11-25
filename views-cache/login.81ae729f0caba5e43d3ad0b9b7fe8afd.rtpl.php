<?php if(!class_exists('Rain\Tpl')){exit;}?>	<!---start-content-->
	<div class="content">
	<div class="container">
		<div class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
			  	
				<h2>Acessar</h2>
				<h3> <?php if( $error != '' ){ ?>
                
                    <?php echo htmlspecialchars( $error, ENT_COMPAT, 'UTF-8', FALSE ); ?>
              
                <?php } ?>
				<form action="/login" id="login-form-wrap" class="login" method="post">

				  <p class="form-row form-row-first">
                        <label for="login">E-mail *</label>
                        <input type="text" id="login" name="login" class="input-text">
                    </p>
				  <p class="form-row form-row-last">
                        <label for="senha">Senha *</label>
                        <input type="password" id="senha" name="password" class="input-text">
                    </p>
				  <a class="forgot" href="/forgot">Esqueceu a senha?</a>
				  <input type="submit" value="Login">

			    </form>
			 
				</h3>
			   </div>	
			   <div id="register-form-wrap"  class="col-md-6 login-right wow fadeInRight" data-wow-delay="0.4s">
				<h2>Criar conta</h2>
				<form action="/register" class="register" method="post">
				   <p class="form-row form-row-first">
                        <label for="nome">Nome Completo *</span>
                        </label>
                        <input type="text" id="nome" name="name" class="input-text" value="<?php echo htmlspecialchars( $registerValues["name"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" style="width:520px;font-size: 15px">
                    </p>
				   <p class="form-row form-row-first">
                        <label for="email">E-mail *
                        </label>
                        <input type="email" id="email" name="email" class="input-text" value="<?php echo htmlspecialchars( $registerValues["email"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" style="width:520px;font-size: 15px">
                    </p>
				  <p class="form-row form-row-first">
                        <label for="phone">Telefone *
                        </label>
                        <input type="text" id="phone" name="phone" class="input-text" value="<?php echo htmlspecialchars( $registerValues["phone"], ENT_COMPAT, 'UTF-8', FALSE ); ?>" style="width:520px;font-size: 15px">
                    </p>
				  <p class="form-row form-row-last">
                        <label for="senha">Senha *</span>
                        </label>
                        <input type="password" id="senha" name="password" class="input-text" style="width:520px;font-size: 15px">
                    </p>
                   <p class="form-row form-row-last">
                        <label for="senha">Confirmar Senha *</span>
                        </label>
                        <input type="password" id="senha" name="confirm_password" class="input-text" style="width:520px;font-size: 15px">
                    </p>
				  <input type="submit" value="Criar Conta" name="login" class="button">
			    </form>
			    <br><h3><?php if( $errorRegister != '' ){ ?>
                
                     <?php echo htmlspecialchars( $errorRegister, ENT_COMPAT, 'UTF-8', FALSE ); ?>
              
                <?php } ?></h3>
			   </div>	
			   <div class="clearfix"> </div>
			 </div>
		   </div>
</div>
</div>
	
