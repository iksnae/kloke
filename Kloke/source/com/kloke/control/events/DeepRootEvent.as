package com.kloke.control.events
{
	import com.kloke.model.types.IrisEvent;

	public class DeepRootEvent extends IrisEvent
	{
		static public const EVENT_ID:String = "deep_root_event";
		public function DeepRootEvent()
		{
			super(EVENT_ID);
		}
		
	}
}