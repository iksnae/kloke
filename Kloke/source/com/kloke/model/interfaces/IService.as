package com.kloke.model.interfaces
{
	import flash.events.IEventDispatcher;

	public interface IService extends IEventDispatcher
	{
		function get connected():Boolean;
        function get status():String;
        function open():void;
        function close():void;
	}
}