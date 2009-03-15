package com.kloke.control.events
{
	import com.kloke.model.types.KlokeEvent;

	public class SectionChangeEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = "section_change_event";
		public function SectionChangeEvent()
		{
			super(EVENT_ID);
		}
		
	}
}