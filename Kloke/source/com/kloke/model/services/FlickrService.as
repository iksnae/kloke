package com.iris.model.services
{
	import flash.events.Event;
	import com.iris.model.interfaces.IService;

	public class FlickrService implements IService
	{
		public function FlickrService()
		{
		}

		public function get connected():Boolean
		{
			return false;
		}
		
		public function get status():String
		{
			return null;
		}
		
		public function open():void
        {
        }
        public function close():void
        {
        }
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return false;
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return false;
		}
		
		public function willTrigger(type:String):Boolean
		{
			return false;
		}
		
	}
}