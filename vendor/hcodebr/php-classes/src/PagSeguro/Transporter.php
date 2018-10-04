<?php

namespace Hcode\PagSeguro;

use \GuzzleHttp\Client;
use Hcode\PagSeguro\Config;

class Transporter{

	public static function createSession()
	{

		$client = new Client();
		$res = $client->request('POST', Config::getUrlSessions() . "?" . http_build_query(Config::getAuthentication()), [
		'verify'=>false

		]);

		$xml = simplexml_load_string($res->getBody()->getContents());

		return ((string)$xml->id);
	}


	public static function sendTransaction(Payment $payment)
	{

		$client = new Client();

		$res = $client->request('POST', Config::getUrlTransaction() . "?" . http_build_query(Config::getAuthentication()), [
            'verify'=>false,
            'headers'=>[
                'Content-Type'=>'application/xml'
            ],
            'body'=>$payment->getDOMDocument()->saveXml()
        ]);

		$xml = simplexml_load_string($res->getBody()->getContents());

		var_dump($xml);
	}
}

?>