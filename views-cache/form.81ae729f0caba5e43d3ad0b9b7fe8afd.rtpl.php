<?php if(!class_exists('Rain\Tpl')){exit;}?><!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
</head>
<body>
  <form action="script.php" method="post">
    <fieldset>
      <legend>Envio sua sugestão</legend>
      <label for="assunto">
          Assunto
        <input type="text" placeholder="Digite o assunto" name="assunto">
      </label><br><br>

      <label for="nome">
        Nome
        <input type="text" placeholder="Digite o seu nome completo" name="nome">
      </label><br><br>

      <label for="email">
       Email
       <input type="email" placeholder="Digite o seu E-mail" name="email">
     </label><br><br>

     <label for="mensagem">
      Mensagem<br>
      <textarea id="" name="mensagem" cols="30" rows="10" placeholder="Digite aqui sua mensagem referente ao assunto"></textarea>
    </label><br><br>
    <input type="submit" name="enviar" value="Enviar sugestão">
    </fieldset>
  </form>
</body>
</html>
