package com.iris.model.interfaces
{
	public interface IConfigObject extends IEventDispatcher
	{
		function get id():String;
		function set id(str:String):void;
		
		function get status():String;
		function set status(str:String):void;
		
		function get type():String;
		function set type(str:String):void;
        
	}
}