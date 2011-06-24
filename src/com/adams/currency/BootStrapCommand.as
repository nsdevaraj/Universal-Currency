/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency
{
	
	import com.adams.swizdao.controller.ServiceController;
	import com.adams.swizdao.model.vo.CurrentInstance;
	import com.adams.currency.model.vo.MapConfigVO;
	
	import flash.events.StatusEvent;
	
	import mx.collections.ArrayCollection;
	import mx.core.FlexGlobals;
	import mx.utils.URLUtil;
	
	
	public class BootStrapCommand
	{
		[Inject]
		public var currentInstance:CurrentInstance; 
		 
		[Inject]
		public var service:ServiceController; 
		/** <p>
		 * Boot straps the application from context, 
		 * with postconstruct metadata the function is called after Injection is performed.
		 * </p>
 		 */
		[PostConstruct]
		public function execute():void
		{ 
			currentInstance.config.serverLocation ='http://themoneyconverter.com/'
			service.serverLocation = currentInstance.config.serverLocation;
			currentInstance.mapConfig =new MapConfigVO(); 
		} 
	}
}