package com.kloke.control.events
{
	import com.kloke.model.types.KlokeEvent;

	public class DeepRootEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = "deep_root_event";
		public function DeepRootEvent()
		{
			super(EVENT_ID);
		}
		
	}
}