package com.kloke.model.interfaces
{
	import flash.events.IEventDispatcher;
	
	public interface ISubject extends IEventDispatcher
	{
		function subscribe(event:String,o:IObserver):void;
		function unSubscribe(event:String,o:IObserver):void;
		function notify(event:String, data:*=null):void;
		
	}
}