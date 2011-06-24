/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.control
{
	import com.adams.swizdao.model.vo.CurrentInstance;
	import com.adams.swizdao.model.vo.SignalVO;
	import com.adams.swizdao.response.SignalSequence;
	import com.adams.swizdao.util.Action;
	import com.adams.swizdao.views.mediators.IViewMediator;
	import com.adams.currency.model.AbstractDAO;
	import com.adams.currency.model.vo.*;
	import com.adams.currency.signal.ControlSignal;
	import com.adams.currency.util.CurrencyUtils;
	import com.adams.currency.view.mediators.MainViewMediator;

	public class SignalsCommand
	{
		
		[Inject]
		public var controlSignal:ControlSignal;
		
		[Inject]
		public var signalSequence:SignalSequence;
		
		[Inject]
		public var mainViewMediator:MainViewMediator;
		
		[Inject]
		public var currentInstance:CurrentInstance; 
		
		[Inject("feeditemDAO")]
		public var feeditemDAO:AbstractDAO;
		
		// todo: add listener
		/**
		 * Whenever an GetFeedEntrySignal is dispatched.
		 * MediateSignal initates this getfeedentryAction to perform control Actions
		 * The invoke functions to perform control functions
		 */
		[ControlSignal(type='getFeedEntrySignal')]
		public function getfeedentryAction(obj:IViewMediator):void {
			var signal:SignalVO = new SignalVO(obj,feeditemDAO,Action.HTTP_REQUEST);
			signal.emailBody = currentInstance.config.serverLocation+currentInstance.mapConfig.sourceCurrency+CurrencyUtils.RSSXML;
			signal.receivers = ['item','channel','rss'];
			signalSequence.addSignal(signal);
		}
		
		/**
		 * Whenever an ChangeStateSignal is dispatched.
		 * MediateSignal initates this changestateAction to perform control Actions
		 * The invoke functions to perform control functions
		 */
		[ControlSignal(type='changeStateSignal')]
		public function changestateAction(state:String):void {
			mainViewMediator.view.currentState = state;
		}
	}
}