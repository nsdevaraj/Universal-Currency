/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.model.vo
{
	import com.adams.swizdao.model.vo.AbstractVO;
	import mx.collections.ArrayCollection;
	[Bindable]
	[RemoteClass(alias='com.rad3.currency.dao.entities.FeedItem')]
	public class FeedItem extends AbstractVO
	{
		private var _feeditemId:int; 
		public function FeedItem()
		{
			super();
		}
		public function get feeditemId():int
		{
			return _feeditemId;
		}
		
		public function set feeditemId(value:int):void
		{
			_feeditemId = value;
		}
		private var _title:String;
		private var _enclosure:String;
		private var _description:String;
		private var _pubDate:Date;
		private var _link:String;
		
		public function get link():String
		{
			return _link;
		}
		
		public function set link(value:String):void
		{
			_link = value;
		}
		
		public function get title():String
		{
			return _title;
		}
		
		public function set title(value:String):void
		{
			_title = value;
		}
		
		public function get pubDate():Date
		{
			return _pubDate;
		}
		
		public function set pubDate(value:Date):void
		{
			_pubDate = value;
		}
		
		public function get enclosure():String
		{
			return _enclosure;
		}
		
		public function set enclosure(value:String):void
		{
			_enclosure = value;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function set description(value:String):void
		{
			_description = value;
		}
		
		override public function fill(item:Object):void{
			title = item.title;
			pubDate = new Date(item.pubDate);
			link = item.link;
			description=item.description;
		}
	}
}