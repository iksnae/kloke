package com.kloke.model.types
{
	import flash.events.Event;

	public class KlokeEvent extends Event
	{
		public var data:*;
		public var caller:*;
		
		public function KlokeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		public function dispatch():void{
            KlokeEventDispatcher.getInstance().dispatchEvent(this)
        }
	}
}