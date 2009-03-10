package com.kloke.model.types
{
	import flash.events.Event;

	public class IrisEvent extends Event
	{
		public var data:*;
		public var caller:*;
		
		public function IrisEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public function dispatch():void{
            IrisEventDispatcher.getInstance().dispatchEvent(this)
        }
	}
}