package com.kloke.control.events
{
	import com.kloke.model.types.IrisEvent;
	import com.kloke.model.types.IrisEventDispatcher;
	
	public class InitEvent extends IrisEvent
	{
		static public const EVENT_ID:String = 'init_event';
		
		public function InitEvent()
		{
			super(EVENT_ID);
		}
		
		
	}
}