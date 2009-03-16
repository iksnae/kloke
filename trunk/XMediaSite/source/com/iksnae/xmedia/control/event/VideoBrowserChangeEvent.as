package com.iksnae.xmedia.control.event
{
	import com.kloke.model.types.KlokeEvent;

	public class VideoBrowserChangeEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = "VideoBrowserChangeEvent";
		public function VideoBrowserChangeEvent()
		{
			super(EVENT_ID);
		}
		
	}
}