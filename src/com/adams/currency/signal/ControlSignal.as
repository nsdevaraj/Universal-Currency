/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.signal
{
	import com.adams.swizdao.views.mediators.IViewMediator;
	import com.adams.swizdao.model.vo.SignalVO;
	
	import mx.collections.ArrayCollection;
	import org.osflash.signals.Signal;
	import com.adams.currency.model.vo.*;
	public class ControlSignal
	{
		// add Signal 
         public var getFeedEntrySignal:Signal= new Signal(IViewMediator);
		public var changeStateSignal:Signal= new Signal(String);
	}
}