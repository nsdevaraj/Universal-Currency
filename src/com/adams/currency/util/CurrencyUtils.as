package com.adams.currency.util
{
	import mx.collections.ArrayCollection;
	
	public class CurrencyUtils
	{
		public static const RSSXML:String='/rss.xml';
		public static const currencies:Array=[United_Arab_Emirates_Dirham,Argentine_Peso,Australian_Dollar,Barbadian_Dollar,Bahraini_Dinar,
			Bolivian_Boliviano,Brazilian_Real,Canadian_Dollar,Swiss_Franc,Chilean_Peso,Chinese_Yuan,Colombian_Peso,Czech_Koruna,
			Danish_Krone,Egyptian_Pound,Euro	,British_Pound_Sterling,Hong_Kong_Dollar,Hungarian_Forint,Indonesian_Rupiah,
			Israeli_Sheqel,Indian_Rupee,Icelandic_Krona,Jamaican_Dollar,Jordanian_Dinar,Japanese_Yen,Kenyan_Shilling,
			South_Korean_Won,Kuwaiti_Dinar,Lebanese_Pound,Sri_Lankan_Rupee,Lithuanian_Litas,Latvian_Lats,Moroccan_Dirham,
			Mexican_Peso,Malaysian_Ringgit,Namibian_Dollar,Nigerian_Naira,Norwegian_Krone,Nepalese_Rupee,New_Zealand_Dollar,
			Omani_Rial,Panamanian_Balboa,Peru_Nuevo_Sol,Philippine_Peso,Pakistani_Rupee,Polish_Zloty,Qatari_Riyal,
			Romanian_Leu,Russian_Rouble,Saudi_Riyal,Swedish_Krona,Singapore_Dollar,Thai_Baht,Turkish_Lira,
			Taiwanese_Dollar,Ukraine_Hryvnia,US_Dollar,Uruguayan_Peso,Venezuelan_Bolivar,Vietnamese_Dong,
			Central_African_CFA_franc,East_Caribbean_Dollar,West_African_CFA_franc,South_African_Rand];
		public static const currencyList:ArrayCollection=new ArrayCollection([
			{country:'United Arab Emirates Dirham(AED)',code:United_Arab_Emirates_Dirham},
			{country:'Argentine Peso (ARS)',code:Argentine_Peso},
			{country:'Australian Dollar (AUD)',code:Australian_Dollar},	
			{country:'Barbadian Dollar(BBD)',code:Barbadian_Dollar},	
			{country:'Bahraini Dinar (BHD)',code:Bahraini_Dinar},		
			{country:'Bolivian Boliviano (BOB)',code:Bolivian_Boliviano},	
			{country:'Brazilian Real (BRL)',code:Brazilian_Real},		
			{country:'Canadian Dollar(CAD)',code:Canadian_Dollar},		
			{country:'Swiss Franc(CHF)',code:Swiss_Franc},	
			{country:'Chilean Peso(CLP)',code:Chilean_Peso},		
			{country:'Chinese Yuan(CNY)',code:Chinese_Yuan},		
			{country:'Colombian Peso (COP)',code:Colombian_Peso},		
			{country:'Czech Koruna(CZK)',code:Czech_Koruna},		
			{country:'Danish Krone(DKK)',code:Danish_Krone},		
			{country:'Egyptian Pound (EGP)',code:Egyptian_Pound},		
			{country:'Euro(EUR)',code:Euro},			
			{country:'British Pound Sterling (GBP)',code:British_Pound_Sterling},	
			{country:'Hong Kong Dollar(HKD)',code:Hong_Kong_Dollar},	
			{country:'Hungarian Forint(HUF)',code:Hungarian_Forint},	
			{country:'Indonesian Rupiah (IDR)',code:Indonesian_Rupiah},	
			{country:'Israeli Sheqel (ILS)',code:Israeli_Sheqel},		
			{country:'Indian Rupee(INR)',code:Indian_Rupee},		
			{country:'Icelandic Krona(ISK)',code:Icelandic_Krona},		
			{country:'Jamaican Dollar(JMD)',code:Jamaican_Dollar},		
			{country:'Jordanian Dinar(JOD)',code:Jordanian_Dinar},		
			{country:'Japanese Yen(JPY)',code:Japanese_Yen},	
			{country:'Kenyan Shilling(KES)',code:Kenyan_Shilling},		
			{country:'South Korean Won(KRW)',code:South_Korean_Won},	
			{country:'Kuwaiti Dinar (KWD)',code:Kuwaiti_Dinar},		
			{country:'Lebanese Pound (LBP)',code:Lebanese_Pound},		
			{country:'Sri Lankan Rupee(LKR)',code:Sri_Lankan_Rupee},	
			{country:'Lithuanian Litas(LTL)',code:Lithuanian_Litas},	
			{country:'Latvian Lats(LVL)',code:Latvian_Lats},		
			{country:'Moroccan Dirham(MAD)',code:Moroccan_Dirham},		
			{country:'Mexican Peso(MXN)',code:Mexican_Peso},		
			{country:'Malaysian Ringgit (MYR)',code:Malaysian_Ringgit},	
			{country:'Namibian Dollar(NAD)',code:Namibian_Dollar},		
			{country:'Nigerian Naira (NGN)',code:Nigerian_Naira},		
			{country:'Norwegian Krone(NOK)',code:Norwegian_Krone},		
			{country:'Nepalese Rupee (NPR)',code:Nepalese_Rupee},		
			{country:'New Zealand Dollar (NZD)',code:New_Zealand_Dollar},		
			{country:'Omani Rial (OMR)',code:Omani_Rial},	
			{country:'Panamanian Balboa (PAB)',code:Panamanian_Balboa},	
			{country:'Peru Nuevo Sol (PEN)',code:Peru_Nuevo_Sol},		
			{country:'Philippine Peso(PHP)',code:Philippine_Peso},		
			{country:'Pakistani Rupee(PKR)',code:Pakistani_Rupee},		
			{country:'Polish Zloty(PLN)',code:Polish_Zloty},		
			{country:'Qatari Riyal(QAR)',code:Qatari_Riyal},		
			{country:'Romanian Leu(RON)',code:Romanian_Leu},		
			{country:'Russian Rouble (RUB)',code:Russian_Rouble},		
			{country:'Saudi Riyal(SAR)',code:Saudi_Riyal},	
			{country:'Swedish Krona (SEK)',code:Swedish_Krona},		
			{country:'Singapore Dollar(SGD)',code:Singapore_Dollar},	
			{country:'Thai Baht (THB)',code:Thai_Baht},	
			{country:'Turkish Lira(TRY)',code:Turkish_Lira},		
			{country:'Taiwanese Dollar(TWD)',code:Taiwanese_Dollar},	
			{country:'Ukraine Hryvnia(UAH)',code:Ukraine_Hryvnia},
			{country:'US Dollar (USD)',code:US_Dollar},	
			{country:'Uruguayan Peso (UYU)',code:Uruguayan_Peso},
			{country:'Venezuelan Bolivar (VEF)',code:Venezuelan_Bolivar},
			{country:'Vietnamese Dong(VND)',code:Vietnamese_Dong},
			{country:'Central African CFA franc (XAF)',code:Central_African_CFA_franc},
			{country:'East Caribbean Dollar (XCD)',code:East_Caribbean_Dollar},	
			{country:'West African CFA franc (XOF)',code:West_African_CFA_franc},	
			{country:'South African Rand (ZAR)',code:South_African_Rand} 
		])
		public static const United_Arab_Emirates_Dirham:String='AED';
		public static const Argentine_Peso	:String='ARS';     
		public static const Australian_Dollar	:String='AUD';     
		public static const Barbadian_Dollar	:String='BBD';     
		public static const Bahraini_Dinar	:String='BHD';     
		public static const Bolivian_Boliviano	:String='BOB';     
		public static const Brazilian_Real	:String='BRL';     
		public static const Canadian_Dollar	:String='CAD';     
		public static const Swiss_Franc		:String='CHF';     
		public static const Chilean_Peso        :String='CLP';     
		public static const Chinese_Yuan        :String='CNY';     
		public static const Colombian_Peso	:String='COP';     
		public static const Czech_Koruna        :String='CZK';     
		public static const Danish_Krone        :String='DKK';     
		public static const Egyptian_Pound	:String='EGP';     
		public static const Euro	        :String='EUR';     
		public static const British_Pound_Sterling:String='GBP';   
		public static const Hong_Kong_Dollar	:String='HKD';     
		public static const Hungarian_Forint	:String='HUF';     
		public static const Indonesian_Rupiah	:String='IDR';     
		public static const Israeli_Sheqel	:String='ILS';     
		public static const Indian_Rupee        :String='INR';     
		public static const Icelandic_Krona	:String='ISK';     
		public static const Jamaican_Dollar	:String='JMD';     
		public static const Jordanian_Dinar	:String='JOD';     
		public static const Japanese_Yen        :String='JPY';     
		public static const Kenyan_Shilling	:String='KES';     
		public static const South_Korean_Won	:String='KRW';     
		public static const Kuwaiti_Dinar	:String='KWD';     
		public static const Lebanese_Pound	:String='LBP';     
		public static const Sri_Lankan_Rupee	:String='LKR';     
		public static const Lithuanian_Litas	:String='LTL';     
		public static const Latvian_Lats        :String='LVL';     
		public static const Moroccan_Dirham	:String='MAD';     
		public static const Mexican_Peso        :String='MXN';     
		public static const Malaysian_Ringgit	:String='MYR';     
		public static const Namibian_Dollar	:String='NAD';     
		public static const Nigerian_Naira	:String='NGN';     
		public static const Norwegian_Krone	:String='NOK';     
		public static const Nepalese_Rupee	:String='NPR';     
		public static const New_Zealand_Dollar	:String='NZD';     
		public static const Omani_Rial		:String='OMR';     
		public static const Panamanian_Balboa	:String='PAB';     
		public static const Peru_Nuevo_Sol	:String='PEN';     
		public static const Philippine_Peso	:String='PHP';     
		public static const Pakistani_Rupee	:String='PKR';     
		public static const Polish_Zloty        :String='PLN';     
		public static const Qatari_Riyal        :String='QAR';     
		public static const Romanian_Leu        :String='RON';     
		public static const Russian_Rouble	:String='RUB';     
		public static const Saudi_Riyal		:String='SAR';     
		public static const Swedish_Krona	:String='SEK';     
		public static const Singapore_Dollar	:String='SGD';     
		public static const Thai_Baht		:String='THB';     
		public static const Turkish_Lira        :String='TRY';     
		public static const Taiwanese_Dollar	:String='TWD';     
		public static const Ukraine_Hryvnia	:String='UAH';     
		public static const US_Dollar		:String='USD';     
		public static const Uruguayan_Peso	:String='UYU';     
		public static const Venezuelan_Bolivar	:String='VEF';     
		public static const Vietnamese_Dong	:String='VND';     
		public static const Central_African_CFA_franc:String='XAF';
		public static const East_Caribbean_Dollar:String='XCD';    
		public static const West_African_CFA_franc:String='XOF';   
		public static const South_African_Rand	:String='ZAR';     
	}
}