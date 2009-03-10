package com.kloke.control.events
{
	import com.kloke.model.types.IrisEvent;

	public class SectionUpdateEvent extends IrisEvent
	{
		static public const EVENT_ID:String = "SectionUpdateEvent";
		public function SectionUpdateEvent()
		{
			super(EVENT_ID);
		}
		
	}
}