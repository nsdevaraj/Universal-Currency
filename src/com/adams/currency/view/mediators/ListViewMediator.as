/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  UniversalCurrency

@internal 

*/
package com.adams.currency.view.mediators
{ 
	import com.adams.currency.model.vo.*;
	import com.adams.currency.signal.ControlSignal;
	import com.adams.currency.util.Utils;
	import com.adams.currency.view.ListSkinView;
	import com.adams.swizdao.model.vo.*;
	import com.adams.swizdao.views.mediators.AbstractViewMediator;
	
	import flash.events.Event;
	
	import mx.core.FlexGlobals;
	import mx.events.ResizeEvent;
	
	import spark.components.List;
	import spark.events.IndexChangeEvent;
	
	public class ListViewMediator extends AbstractViewMediator
	{ 		 
		
		[Inject]
		public var currentInstance:CurrentInstance; 
		
		[Inject]
		public var controlSignal:ControlSignal;
		
		private var objName:String;
		private var _homeState:String;
		public function get homeState():String
		{
			return _homeState;
		}
		
		public function set homeState(value:String):void
		{
			_homeState = value;
			if(value==Utils.LIST_INDEX) addEventListener(Event.ADDED_TO_STAGE,addedtoStage);
		}
		
		protected function addedtoStage(ev:Event):void{
			init();
		}
		
		/**
		 * Constructor.
		 */
		public function ListViewMediator( viewType:Class=null )
		{
			super( ListSkinView ); 
		}
		
		/**
		 * Since the AbstractViewMediator sets the view via Autowiring in Swiz,
		 * we need to create a local getter to access the underlying, expected view
		 * class type.
		 */
		public function get view():ListSkinView 	{
			return _view as ListSkinView;
		}
		
		[MediateView( "ListSkinView" )]
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
			viewState = Utils.LIST_INDEX;
			var list:Object = currentInstance.mapConfig.currentList;
			
			view.list.dataProvider = list.dataProvider;
			view.list.selectedIndex = list.selectedIndex;
			callLater(setScroll);
			objName = list.objName;
			applicationResizeHandler(); 
		}   
		
		protected function setScroll():void{
			view.list.ensureIndexIsVisible(view.list.selectedIndex);
		}
		/**
		 * Create listeners for all of the view's children that dispatch events
		 * that we want to handle in this mediator.
		 */
		override protected function setViewListeners():void {
			FlexGlobals.topLevelApplication.addEventListener(ResizeEvent.RESIZE,applicationResizeHandler, false, 0, true);
			view.list.addEventListener(IndexChangeEvent.CHANGE,updateSrcCurrencyProvider );
			super.setViewListeners(); 
		}
		
		private function updateSrcCurrencyProvider (ev:IndexChangeEvent  ):void{
			currentInstance.mapConfig.currentListItem = ev.currentTarget.selectedItem;
			currentInstance.mapConfig.currentListName = objName;
			controlSignal.changeStateSignal.dispatch(Utils.HOME_INDEX);
		}
		
		protected function applicationResizeHandler(event:ResizeEvent=null):void{
			view.currentState =FlexGlobals.topLevelApplication.aspectRatio;
		} 
		
		override protected function pushResultHandler( signal:SignalVO ): void { 
		} 
		/**
		 * Remove any listeners we've created.
		 */
		override protected function cleanup( event:Event ):void {
			FlexGlobals.topLevelApplication.removeEventListener(ResizeEvent.RESIZE,applicationResizeHandler);
			super.cleanup( event ); 		
		} 
	}
}