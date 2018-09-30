<?php

use \Hcode\Page;
use \Hcode\Model\User;
use \Hcode\PagSeguro\Config;
use \Hcode\PagSeguro\Transporter;
use \Hcode\PagSeguro\Document;
use \Hcode\Model\Order;

$app->post("/payment/credit", function(){

	User::verifyLogin(false);

	$order = new Order();

	$order->getFromSession();

	$address = $order->getAddress();

	$cart = $order->getCart();

	$cpf = new Document(Document::CPF, $_POST['cpf']);

	$dom = new DOMDocument();

	$test = $cpf->getDOMElement();

	$testNode = $dom->importNode($test, true);

	$dom->appendChild($testNode);

	echo $dom->saveXml();




});

$app->get('/payment', function(){

	User::verifyLogin(false);

	$order = new Order();

	$order->getFromSession();

	$years = [];


	for ($y = date('Y'); $y < date('Y')+14; $y++)
    {
        array_push($years, $y);
    }

	$page = new Page();


	$page->setTpl("payment", [

		"order"=>$order->getValues(),
		"msgError"=>Order::getError(),
		"years"=>$years,
		"pagseguro"=>[
			"urlJS"=>Config::getUrlJS(),
			"id"=>Transporter::createSession(),
			"maxInstallmentNoInterest"=>Config::MAX_INSTALL_MENT_NO_INTEREST,
			"maxInstallment"=>Config::MAX_INSTALLMENT

		]

	]);

});




?>