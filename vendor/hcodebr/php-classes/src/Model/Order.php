<?php

namespace Hcode\Model;

use \Hcode\DB\Sql;
use \Hcode\Model;
use \Hcode\Model\Cart;
use \Hcode\Model\Address;


class Order extends Model {

	const SUCCESS = "Order-Success";
	const ERROR = "Order-Error";
	const SESSION = "OrderSession";

	public function save()
	{

		$sql = new Sql();

			$results = $sql->select("CALL sp_orders_save(:idorder, :idcart, :iduser, :idstatus, :idaddress, :vltotal)", [
			':idorder'=>$this->getidorder(),
			':idcart'=>$this->getidcart(),
			':iduser'=>$this->getiduser(),
			':idstatus'=>$this->getidstatus(),
			':idaddress'=>$this->getidaddress(),
			':vltotal'=>$this->getvltotal()
		]);

		if(count($results) > 0) {

			$this->setData($results[0]);

		}
	}

	public function get($idorder)
	{

		$sql = new Sql();

		$results = $sql->select("
			SELECT 
				a.idorder, a.idcart, a.idcart, a.iduser, a.idstatus, a.idaddress, a.vltotal, a.dtregister,
				b.desstatus,
				c.dessessionid, c.deszipcode, c.vlfreight, c.nrdays,
				d.idperson, d.deslogin,
				e.desaddress, e.desnumber, e.descomplement, e.descity, e.desstate, e.descountry, e.deszipcode, e.desdistrict,
				f.desperson, f.desemail, f.nrphone,
				g.descode, g.vlgrossamount, g.vldiscountamount, g.vlfeeamount, g.vlnetamount, g.vlextraamount, g.despaymentlink
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			LEFT JOIN tb_orderspagseguro g ON g.idorder = a.idorder
			WHERE a.idorder = :idorder
		", [
			':idorder'=>$idorder
		]);

		if (count($results) > 0) {
			$this->setData($results[0]);
		}

	}


	public static function listAll()
	{

		$sql = new Sql();

		
			return $sql->select("
			SELECT * 
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			ORDER BY a.dtregister DESC

		",[

		]);

	}

	public static function listAllDash()
	{

		$sql = new Sql();

		
			return $sql->select("
			SELECT * 
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE a.idstatus = 3
			ORDER BY a.dtregister DESC LIMIT 8

		",[

		]);

	}

	public function delete()
	{
		
		$sql = new Sql();

		$sql->query("DELETE FROM tb_orders WHERE idorder = :idorder", [
			':idorder'=>$this->getidorder()
		]);
	}

	public function getCart():Cart
	{

		$cart = new Cart();

		$cart->get((int)$this->getidcart());

		return $cart;

	}

	public static function setError($msg)
	{
		$_SESSION[Order::ERROR] = $msg;
	}

	public static function getError()
	{
		$msg = (isset($_SESSION[Order::ERROR]) && $_SESSION[Order::ERROR]) ? $_SESSION[Order::ERROR] : '';
		Order::clearError();
		return $msg;
	}

	public static function clearError()
	{
		$_SESSION[Order::ERROR] = NULL;
	}

	public static function setSuccess($msg)
	{
		$_SESSION[Order::SUCCESS] = $msg;
	}

	public static function getSuccess()
	{
		$msg = (isset($_SESSION[Order::SUCCESS]) && $_SESSION[Order::SUCCESS]) ? $_SESSION[Order::SUCCESS] : '';

		Order::clearSuccess();

		return $msg;
	}

	public static function clearSuccess()
	{
		$_SESSION[Order::SUCCESS] = NULL;
	}

	public static function getPage($page = 1, $itemsPerPage = 10)
	{

 		$start = ($page - 1) * $itemsPerPage;
 		$sql = new Sql();
 		$results = $sql->select("
			SELECT SQL_CALC_FOUND_ROWS *
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			ORDER BY a.dtregister DESC
			LIMIT $start, $itemsPerPage;
		");

 		$resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal;");

 		return [
			'data'=>$results,
			'total'=>(int)$resultTotal[0]["nrtotal"],
			'pages'=>ceil($resultTotal[0]["nrtotal"] / $itemsPerPage)
		];
 	}

 	public static function getPageSearch($search, $page = 1, $itemsPerPage = 10)
	{
 		$start = ($page - 1) * $itemsPerPage;

 		$sql = new Sql();

 		$results = $sql->select("
			SELECT SQL_CALC_FOUND_ROWS *
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE a.idorder = :id OR f.desperson LIKE :search or b.desstatus LIKE :search
			ORDER BY a.dtregister DESC
			LIMIT $start, $itemsPerPage;
		", [
			':search'=>'%'.$search.'%',
			':id'=>$search
		]);

 		$resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal;");

 		return [
			'data'=>$results,
			'total'=>(int)$resultTotal[0]["nrtotal"],
			'pages'=>ceil($resultTotal[0]["nrtotal"] / $itemsPerPage)
		];
 	}

 	public function toSession()
 	{

 		$_SESSION[Order::SESSION] = $this->getValues();
 	}

 	public function getFromSession()
 	{

 		$this->setData($_SESSION[Order::SESSION]);
 	}

 	public function getAddress():Address
 	{

 		$address = new Address();

 		$address->setData($this->getValues());

 		return $address;
 	}

 	public function setPagSeguroTransactionRespose(
		string $descode, 
		float $vlgrossamount,
		float $vldisccountamount,
		float $vlfeeamont,
		float $vlnetamount,
		float $extraamount,
		string $despaymentlink = ""	
	)
	{

		$sql = new Sql();

		$sql->query("CALL sp_orderspagseguro_save(:idorder, :descode, :vlgrossamount, :vldisccountamount, :vlfeeamont, :vlnetamount, :extraamount, :despaymentlink)", [
			':idorder'=>$this->getidorder(),
			':descode'=>$descode,
			':vlgrossamount'=>$vlgrossamount,
			':vldisccountamount'=>$vldisccountamount,
			':vlfeeamont'=>$vlfeeamont,
			':vlnetamount'=>$vlnetamount,
			':extraamount'=>$extraamount,
			':despaymentlink'=>$despaymentlink
		]);

	}

 	public static function quantOrders()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson;");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
	}

	public static function quantOrdersEmAberto()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders where idstatus = 1;");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
	}


	public static function quantOrdersAgPagamento()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders where idstatus = 2;");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
    }


	public static function quantOrdersPago()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders where idstatus = 3;");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
	}

	public static function quantOrdersEntregue()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders where idstatus = 4;");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
	}


	public static function quantOrdersPgCincoDias()
	{ 
     	$sql = new Sql();
 
     	$count = $sql->select("SELECT COUNT(*) AS nrtotal FROM tb_orders WHERE idstatus = 3 AND dtregister
			BETWEEN CURRENT_DATE()-5 AND CURRENT_DATE() 
			AND now();");

     	if (count($count) > 0) {
         	return $count[0]['nrtotal'];
     	}
	}


	public static function somaVlTotalEmAberto()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where idstatus = 1;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function somaVlTotalAgPagamento()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where idstatus = 2;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function somaVlTotalPago()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where idstatus = 3;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function somaVlTotal()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function TotalPagoMesJan()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '1' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function TotalPagoMesFev()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '2' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function TotalPagoMesMar()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '3' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function TotalPagoMesAbril()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '4' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];
     	
	}

	public static function TotalPagoMesMaio()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '5' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesJun()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '6' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesJul()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '7' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesAgo()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '8' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesSet()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '9' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesOut()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '10' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesNov()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '11' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}

	public static function TotalPagoMesDez()
	{ 
     	$sql = new Sql();
 
     	$soma = $sql->select("select SUM(vltotal) as valor_total from tb_orders where MONTH(dtregister) = '12' AND year(dtregister) = '2018' AND idstatus = 3;");

         	return $soma[0]['valor_total'];	
	}



	public function listAllOrdersPagos()
	{

		$sql = new Sql();

		
		return $sql->select("
			SELECT * 
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE b.idstatus = 3
			ORDER BY a.dtregister DESC

		",[

		]);

	}

	public static function getlistAllOrdersPagos($status = 3)
	{

 		$sql = new Sql();

 		$results = $sql->select("
			SELECT SQL_CALC_FOUND_ROWS *
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE b.idstatus = $status
			ORDER BY a.dtregister DESC
		", [

		]);

 		$resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal;");

 		return [
			'data'=>$results
			
		];
 	}

 	public static function getlistAllOrdersEmAberto($status = 1)
	{

 		$sql = new Sql();

 		$results = $sql->select("
			SELECT SQL_CALC_FOUND_ROWS *
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE b.idstatus = $status
			ORDER BY a.dtregister DESC
		", [

		]);

 		$resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal;");

 		return [
			'data'=>$results
			
		];
 	}


 	public static function getlistAllOrdersAgPagamento($status = 2)
	{

 		$sql = new Sql();

 		$results = $sql->select("
			SELECT SQL_CALC_FOUND_ROWS *
			FROM tb_orders a 
			INNER JOIN tb_ordersstatus b USING(idstatus) 
			INNER JOIN tb_carts c USING(idcart)
			INNER JOIN tb_users d ON d.iduser = a.iduser
			INNER JOIN tb_addresses e USING(idaddress)
			INNER JOIN tb_persons f ON f.idperson = d.idperson
			WHERE b.idstatus = $status
			ORDER BY a.dtregister DESC
		", [

		]);

 		$resultTotal = $sql->select("SELECT FOUND_ROWS() AS nrtotal;");

 		return [
			'data'=>$results
			
		];
 	}


     	
	
}
	
?>