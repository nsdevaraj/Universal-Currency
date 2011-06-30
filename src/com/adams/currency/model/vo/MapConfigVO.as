/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.model.vo
{ 

	[Bindable]
	public class MapConfigVO 
	{
		 public var sourceCurrency:String;
		 public var targetCurrency:String;
		 public var currencyRate:Number;
		 public var currentList:Object;
		 public var currentListItem:Object;
		 public var currentListName:String;
	}
}