/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.view.mediators
{ 
	import com.adams.currency.model.AbstractDAO;
	import com.adams.currency.model.vo.*;
	import com.adams.currency.signal.ControlSignal;
	import com.adams.currency.util.CurrencyUtils;
	import com.adams.currency.util.Utils;
	import com.adams.currency.view.HomeSkinView;
	import com.adams.swizdao.dao.PagingDAO;
	import com.adams.swizdao.model.vo.*;
	import com.adams.swizdao.response.SignalSequence;
	import com.adams.swizdao.util.Action;
	import com.adams.swizdao.util.ArrayUtil;
	import com.adams.swizdao.util.Description;
	import com.adams.swizdao.util.ObjectUtils;
	import com.adams.swizdao.views.components.NativeList;
	import com.adams.swizdao.views.mediators.AbstractViewMediator;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.core.FlexGlobals;
	import mx.events.ResizeEvent;
	import mx.events.StateChangeEvent;
	
	import spark.events.IndexChangeEvent;
	import spark.events.TextOperationEvent;
	
	
	public class HomeViewMediator extends AbstractViewMediator
	{ 		 
		
		[Inject]
		public var currentInstance:CurrentInstance; 
		
		[Inject]
		public var controlSignal:ControlSignal;
		
		[Inject("feeditemDAO")]
		public var feeditemDAO:AbstractDAO;
		
		private var _homeState:String;
		public function get homeState():String
		{
			return _homeState;
		}
		
		public function set homeState(value:String):void
		{
			_homeState = value;
			if(value==Utils.HOME_INDEX) addEventListener(Event.ADDED_TO_STAGE,addedtoStage);
		}
		
		protected function addedtoStage(ev:Event):void{
			init();
		}
		
		/**
		 * Constructor.
		 */
		public function HomeViewMediator( viewType:Class=null )
		{
			super( HomeSkinView ); 
		}
		
		/**
		 * Since the AbstractViewMediator sets the view via Autowiring in Swiz,
		 * we need to create a local getter to access the underlying, expected view
		 * class type.
		 */
		public function get view():HomeSkinView 	{
			return _view as HomeSkinView;
		}
		
		[MediateView( "HomeSkinView" )]
		override public function setView( value:Object ):void { 
			super.setView(value);	
		}  
		/**
		 * The <code>init()</code> method is fired off automatically by the 
		 * AbstractViewMediator when the creation complete event fires for the
		 * corresponding ViewMediator's view. This allows us to listen for events
		 * and set data bindings on the view with the confidence that our view
		 * and all of it's child views have been created and live on the stage.
		 */
		override protected function init():void {
			super.init();  
			viewState = Utils.HOME_INDEX;
			setDataProviders();
			getLatestValueHandler();
		} 
		
		protected function setDataProviders():void {	    
			view.src.dataProvider = CurrencyUtils.currencyList;
			view.dest.dataProvider = CurrencyUtils.currencyList;
			view.src.selectedItem = CurrencyUtils.currencyList.list.getItemAt(40);
			view.dest.selectedItem = CurrencyUtils.currencyList.list.getItemAt(57);
			currentInstance.mapConfig.sourceCurrency = view.src.selectedItem.code;
			currentInstance.mapConfig.targetCurrency = view.dest.selectedItem.code;
		}
		
		private function updateSrcCurrencyProvider ( currencyObj:Object ):void{
			if( currencyObj ) {
				if( CurrencyUtils.currencyList.getItemIndex( currencyObj ) != -1 )  {
					currentInstance.mapConfig.sourceCurrency = view.src.selectedItem.code;
					getLatestValueHandler();
				}
			}
		}
		
		private function updateDestCurrencyProvider ( currencyObj:Object ):void{
			if( currencyObj ) {
				if( CurrencyUtils.currencyList.getItemIndex( currencyObj ) != -1 )  {
					currentInstance.mapConfig.targetCurrency = view.dest.selectedItem.code;
					getLatestValueHandler();
				}
			}
		}
		
		override protected function serviceResultHandler( obj:Object,signal:SignalVO ):void {  
			if( signal.destination == Utils.FEEDITEMKEY && signal.action == Action.HTTP_REQUEST ){
				var foundFeed:FeedItem =feeditemDAO.collection.findExistingPropItem(getFindFeed(),Utils.FEEDITEMKEY) as FeedItem;
				setFormValues(foundFeed);
			}
		}
		
		protected function getFindFeed():FeedItem{
			var getFeed:FeedItem = new FeedItem();
			getFeed.title = currentInstance.mapConfig.targetCurrency+'/'+currentInstance.mapConfig.sourceCurrency
			return getFeed;
		}
		
		protected function setFormValues(foundFeed:FeedItem):void {
			view.time.text = foundFeed.pubDate.toLocaleDateString()+ ' '+foundFeed.pubDate.toLocaleTimeString();
			view.rate.text =foundFeed.description;
			view.srcLbl.text = currentInstance.mapConfig.sourceCurrency;
			view.destLbl.text = currentInstance.mapConfig.targetCurrency;
			if(foundFeed.description)currentInstance.mapConfig.currencyRate = Number(foundFeed.description.split('= ')[1].split(' ')[0]);
			view.srcAmount.text = '1';
			onSrcTextHandler();
		}
		
		/**
		 * Create listeners for all of the view's children that dispatch events
		 * that we want to handle in this mediator.
		 */
		override protected function setViewListeners():void {
			super.setViewListeners(); 
			view.refresh.clicked.add(getLatestValueHandler);
			view.controlsPanel.addEventListener(IndexChangeEvent.CHANGE,onViewChangeHandler,false,0,true);
			view.srcAmount.addEventListener(TextOperationEvent.CHANGE,onSrcTextHandler,false,0,true);
			view.destAmount.addEventListener(TextOperationEvent.CHANGE,onDestTextHandler,false,0,true);
			
			FlexGlobals.topLevelApplication.addEventListener(ResizeEvent.RESIZE,application_resizeHandler, false, 0, true);
			view.src.selectedSignal.add( updateSrcCurrencyProvider );
			view.dest.selectedSignal.add( updateDestCurrencyProvider );
		}
		
		protected function application_resizeHandler(event:ResizeEvent=null):void{
			view.currentState = FlexGlobals.topLevelApplication.aspectRatio
		}
		
		protected function onSrcTextHandler(event:TextOperationEvent=null):void{
			view.destAmount.text = (currentInstance.mapConfig.currencyRate*parseInt(view.srcAmount.text)).toString();
			currentInstance.mapConfig.sourceCurrency = view.src.selectedItem.code;
		}
		
		protected function onDestTextHandler(event:TextOperationEvent=null):void{
			view.srcAmount.text = (parseInt(view.destAmount.text)/currentInstance.mapConfig.currencyRate).toString();
			currentInstance.mapConfig.targetCurrency = view.dest.selectedItem.code;
		}
		
		protected function onViewChangeHandler(event:IndexChangeEvent):void{
			view.src.labelField =view.controlsPanel.selectedItem.value;
			view.dest.labelField =view.controlsPanel.selectedItem.value;
			view.src.selectedItem = view.src.selectedItem; 
			view.dest.selectedItem = view.dest.selectedItem;
			
		}	
		
		protected function getLatestValueHandler(event:MouseEvent=null): void {
			if(currentInstance.mapConfig.targetCurrency != currentInstance.mapConfig.sourceCurrency){
				var foundFeed:FeedItem =feeditemDAO.collection.findExistingPropItem(getFindFeed(),Utils.FEEDITEMKEY) as FeedItem;
				if(foundFeed && event==null){
					setFormValues(foundFeed);
				}else{
					controlSignal.getFeedEntrySignal.dispatch(this);
				}
			}else{
				var dummyItem:FeedItem = new FeedItem();
				dummyItem.pubDate = new Date();
				setFormValues(dummyItem);
				currentInstance.mapConfig.currencyRate = 1;
				view.srcAmount.text = '1';
				onSrcTextHandler();
			}
		} 
		
		/**
		 * Remove any listeners we've created.
		 */
		override protected function cleanup( event:Event ):void {
			view.refresh.clicked.removeAll();
			view.controlsPanel.removeEventListener(IndexChangeEvent.CHANGE,onViewChangeHandler);
			view.srcAmount.removeEventListener(TextOperationEvent.CHANGE,onSrcTextHandler);
			view.destAmount.removeEventListener(TextOperationEvent.CHANGE,onDestTextHandler);
			
			view.src.selectedSignal.removeAll();
			view.dest.selectedSignal.removeAll();
			super.cleanup( event ); 		
			
		} 
	}
}