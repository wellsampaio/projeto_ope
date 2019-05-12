<?php

namespace Hcode\PagSeguro;

class Config{

	const SANDBOX = false;

	const SANDBOX_EMAIL = "";
	const PRODUCTION_EMAIL = "casadedonabrasilina@gmail.com";

	const SANDBOX_TOKEN = "";
	const PRODUCTION_TOKEN = "ef35ed86-f2b5-4342-b19f-161250bbdc8fb4e2a5be490983e08e26ab5d3eef9e023aad-def3-4988-8f31-b91d7f8a0550";

	const SANDBOX_SESSIONS = "https://ws.sandbox.pagseguro.uol.com.br/v2/sessions";
	const PRODUCTION_SESSIONS = "https://ws.pagseguro.uol.com.br/v2/sessions";

	const SANDBOX_URL_JS = "https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
	const PRODUCTION_URL_JS = "https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";

	const SANDBOX_URL_TRANSACTION  = "https://ws.sandbox.pagseguro.uol.com.br/v2/transactions";
	const PRODUCTION_URL_TRANSACTION = "https://ws.pagseguro.uol.com.br/v2/transactions";

	const SANDBOX_URL_NOTIFICATION = "https://ws.sandbox.pagseguro.uol.com.br/v2/transactions/notifications/";
	const PRODUCTION_URL_NOTIFICATION = "https://ws.pagseguro.uol.com.br/v2/transactions/notifications/";

	const  MAX_INSTALL_MENT_NO_INTEREST = 2;
	const  MAX_INSTALLMENT = 10;

	const NOTIFICATION_URL = "https://www.casadedonabrasilina.com.br/payment/notification";

	
	public static function getAuthentication():array
	{

		if (Config::SANDBOX === true)
		{

			return [
				"email"=>Config::SANDBOX_EMAIL,
				"token"=>Config::SANDBOX_TOKEN
			]; 
		} else {

			return [
				"email"=>Config::PRODUCTION_EMAIL,
				"token"=>Config::PRODUCTION_TOKEN
			];

		}
	}

	public static function getUrlSessions():string
	{

		return (Config::SANDBOX === true) ? Config::SANDBOX_SESSIONS : Config::PRODUCTION_SESSIONS;
	}

	public static function getUrlJS()
	{

		return (Config::SANDBOX === true) ? Config::SANDBOX_URL_JS : Config::PRODUCTION_URL_JS;

	}

	public static function getUrlTransaction()
	{

		return (Config::SANDBOX === true) ? Config::SANDBOX_URL_TRANSACTION : Config::PRODUCTION_URL_TRANSACTION;

	} 

	public static function getNotificationTransactionURL()
	{

		return (Config::SANDBOX === true) ? Config::SANDBOX_URL_NOTIFICATION : Config::PRODUCTION_URL_NOTIFICATION;

	}

}



?>