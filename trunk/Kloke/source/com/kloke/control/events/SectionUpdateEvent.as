package com.kloke.control.events
{
	import com.kloke.model.types.KlokeEvent;

	public class SectionUpdateEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = "SectionUpdateEvent";
		public function SectionUpdateEvent()
		{
			super(EVENT_ID);
		}
		
	}
}