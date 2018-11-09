<?php

use \Hcode\PageAdmin;
use \Hcode\Model\User;
use \Hcode\Model\Order;
use \Hcode\Model\Product;
use \Hcode\Model\Category;


$app->get('/admin', function() {

	User::verifyLogin();

	$users = User::listAllDash();
	$quantUsers = User::quantUsers();

	$products = Product::listAllDash();

	$quantOrders = Order::quantOrders();
	$quantOrdersPago = Order::quantOrdersPago();
	$quantOrdersAgPagamento = Order::quantOrdersAgPagamento();
	$quantOrdersEmAberto = Order::quantOrdersEmAberto();
	$quantOrdersEntregue = Order::quantOrdersEntregue();

	$somaVlTotal = Order::somaVlTotal();
	$somaVlTotalPago = Order::somaVlTotalPago(); 
	$somaVlTotalAgPagamento = Order::somaVlTotalAgPagamento();
	$somaVlTotalEmAberto = Order::somaVlTotalEmAberto();

	$quantProducts = Product::quantProducts();

	$quantCategory = Category::quantCategory();

	$totalPagoJan = Order::TotalPagoMesJan();
	$totalPagoFev = Order::TotalPagoMesFev();
	$totalPagoMar = Order::TotalPagoMesMar();
	$totalPagoAbril = Order::TotalPagoMesAbril();
	$totalPagoMaio = Order::TotalPagoMesMaio();
	$totalPagoJun= Order::TotalPagoMesJun();
	$totalPagoJul = Order::TotalPagoMesJul();
	$totalPagoAgo = Order::TotalPagoMesAgo();
	$totalPagoSet = Order::TotalPagoMesSet();
	$totalPagoOut = Order::TotalPagoMesOut();
	$totalPagoNov = Order::TotalPagoMesNov();
	$totalPagoDez = Order::TotalPagoMesDez();


	$page = new PageAdmin([
		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("index2",[
		'totalPagoJan'=>$totalPagoJan,
		'totalPagoFev'=>$totalPagoFev,
		'totalPagoMar'=>$totalPagoMar,
		'totalPagoAbril'=>$totalPagoAbril,
		'totalPagoMaio'=>$totalPagoMaio,
		'totalPagoJun'=>$totalPagoJun,
		'totalPagoJul'=>$totalPagoJul,
		'totalPagoAgo'=>$totalPagoAgo,
		'totalPagoSet'=>$totalPagoSet,
		'totalPagoOut'=>$totalPagoOut,
		'totalPagoNov'=>$totalPagoNov,
		'totalPagoDez'=>$totalPagoDez,

		'somaVlTotalPago'=>$somaVlTotalPago,
		'somaVlTotalAgPagamento'=>$somaVlTotalAgPagamento,
		'somaVlTotal'=>$somaVlTotal,
		'somaVlTotalEmAberto'=>$somaVlTotalEmAberto,

		'quantOrders'=>$quantOrders,
		'quantOrdersPago'=>$quantOrdersPago,
		'quantOrdersAgPagamento'=>$quantOrdersAgPagamento,
		'quantOrdersEmAberto'=>$quantOrdersEmAberto,
		'quantOrdersEntregue'=>$quantOrdersEntregue,

		'quantUsers'=>$quantUsers,
		'quantProducts'=>$quantProducts,
		'quantCategory'=>$quantCategory,

		"users"=>$users,

		"orders"=>Order::listAllDash(),

		'products'=>Product::checkList($products)


	]);
    
	

});

$app->get('/admin/dashboard', function() {

	User::verifyLogin();

	
	$quantUsers = User::quantUsers();

	$quantOrders = Order::quantOrders();

	$quantOrdersPago = Order::quantOrdersPago();

	$quantOrdersEmAberto = Order::quantOrdersEmAberto();

	$quantOrdersEntregue = Order::quantOrdersEntregue();

	$quantOrdersAgPagamento = Order::quantOrdersAgPagamento();

	$somaVlTotal = Order::somaVlTotal();

	$somaVlTotalPago = Order::somaVlTotalPago(); 

	$somaVlTotalAgPagamento = Order::somaVlTotalAgPagamento();


	$page = new PageAdmin([
		"header"=>false,
		"footer"=>false
	]);

	$page->setTpl("flot",[
		"quantUsers"=>$quantUsers,
		"quantOrders"=>$quantOrders,
		"quantOrdersEmAberto"=>$quantOrdersEmAberto,
		"quantOrdersPago"=>$quantOrdersPago,
		"quantOrdersEntregue"=>$quantOrdersEntregue,
		"quantOrdersAgPagamento"=>$quantOrdersAgPagamento,
		"somaVlTotal"=>$somaVlTotal,
		"somaVlTotalPago"=>$somaVlTotalPago,
		"somaVlTotalAgPagamento"=>$somaVlTotalAgPagamento,
	]);
    
	

});

$app->get('/admin/login', function(){

	$page = new PageAdmin([

		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("login", [
		'error'=>User::getError()
	]);
});

$app->post("/admin/login", function(){

	try {
		
		User::login($_POST['login'], $_POST['password']);

	} catch(Exception $e) {

		User::setError($e->getMessage());
	}

	header("Location: /admin");
	exit;

});

$app->get('/admin/logout', function(){

	User::logout();

	header("Location: /admin/login");
	exit;
});

$app->get("/admin/forgot", function(){

	$page = new PageAdmin([

		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("forgot", [
		'error'=>User::getError()
	]);


});

$app->post("/admin/forgot", function(){

	try {
	$user = User::getForgot($_POST["email"]);

	} catch(Exception $e) {

		User::setError($e->getMessage());
		header("Location: /admin/forgot");
		exit;
	}

	header("Location: /admin/forgot/sent");
	exit;

});

$app->get("/admin/forgot/sent", function(){

	$page = new PageAdmin([

		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("forgot-sent");
});

$app->get("/admin/forgot/reset", function(){

	$user = User::validForgotDecrypt($_GET["code"]);

	$page = new PageAdmin([

		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("forgot-reset", array(
		"name"=>$user["desperson"],
		"code"=>$_GET["code"]

	));
});

$app->post("/admin/forgot/reset", function(){

	$forgot = User::validForgotDecrypt($_POST["code"]);

	User::setForgotUsed($forgot["idrecovery"]);

	$user = new User();

	$user->get((int)$forgot["iduser"]);

	$password = password_hash($_POST["password"], PASSWORD_DEFAULT, [
		"cost"=>12

	]);

	$user->setPassword($password);

	$page = new PageAdmin([

		"header"=>false,
		"footer"=>false

	]);

	$page->setTpl("forgot-reset-success");

});

?>