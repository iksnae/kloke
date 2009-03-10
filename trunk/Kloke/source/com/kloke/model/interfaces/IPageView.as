package com.kloke.model.interfaces
{
	import flash.events.IEventDispatcher;
	
	/**
	 * this interface is for each page view... 
	 * @author iksnae
	 * 
	 */	
	public interface IPageView extends IEventDispatcher, IObserver
	{
		function get state():String;
		function hide():void;
		function show():void;
	
	}
}