package com.iris.model.interfaces
{
	public interface IDataObject extends IEventDispatcher
	{
		function get id():String;
        function set id(str:String):void;
        
        function get source():String;
        function set source(str:String):void;
        
        function get type():String;
        function set type(str:String):void;
        
        function get data():Object;
        function set data(obj:Object):void;
        
        function get ready():Boolean;
        function get status():String;
        
        
        
	}
}