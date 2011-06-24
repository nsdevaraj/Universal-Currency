/*

Copyright (c) 2011 Adams Studio India, All Rights Reserved 

@author   NS Devaraj
@contact  nsdevaraj@gmail.com
@project  CurrencyConverter

@internal 

*/
package com.adams.currency.model.processor
{
	import com.adams.currency.model.AbstractDAO;
	import com.adams.currency.model.vo.FeedItem;
	
	import com.adams.swizdao.model.vo.IValueObject;
	import com.adams.swizdao.model.processor.AbstractProcessor;

	public class FeedItemProcessor extends AbstractProcessor
	{   
		public function FeedItemProcessor()
		{
			super();
		}
		//@TODO
		override public function processVO(vo:IValueObject):void
		{
			if(!vo.processed){
				var feeditemvo:FeedItem = vo as FeedItem;
				super.processVO(vo);
			}
		}
	}
}