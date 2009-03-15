package com.kloke.control.events
{
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.model.types.KlokeEventDispatcher;
	
	public class InitEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = 'init_event';
		
		public function InitEvent()
		{
			super(EVENT_ID);
		}
		
		
	}
}