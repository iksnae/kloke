package com.iksnae.xmedia.control.event
{
	import com.kloke.model.types.IrisEvent;

	public class VideoBrowserChangeEvent extends IrisEvent
	{
		static public const EVENT_ID:String = "VideoBrowserChangeEvent";
		public function VideoBrowserChangeEvent()
		{
			super(EVENT_ID);
		}
		
	}
}