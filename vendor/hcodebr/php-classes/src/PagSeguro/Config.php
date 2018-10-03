<?php

namespace Hcode\PagSeguro;

class Config{

	const SANDBOX = true;

	const SANDBOX_EMAIL = "wellington.victalino@gmail.com";
	const PRODUCTION_EMAIL = "wellington.victalino@gmail.com";

	const SANDBOX_TOKEN = "24F19271CF5B42ED8CE789EEB0EECF6B";
	const PRODUCTION_TOKEN = "7FA6F0929BCA4AB1BF47CEBB67A6E7D2";

	const SANDBOX_SESSIONS = "https://ws.sandbox.pagseguro.uol.com.br/v2/sessions";
	const PRODUCTION_SESSIONS = "https://ws.pagseguro.uol.com.br/v2/sessions";

	const SANDBOX_URL_JS = "https://stc.sandbox.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";
	const PRODUCTION_URL_JS = "https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.directpayment.js";

	const  MAX_INSTALL_MENT_NO_INTEREST = 10;
	const  MAX_INSTALLMENT = 10;

	const NOTIFICATION_URL = "http://www.casadedonabrasilina.com.br/payment/notification";

	
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


}



?>