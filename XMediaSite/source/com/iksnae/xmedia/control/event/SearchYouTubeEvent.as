package com.iksnae.xmedia.control.event
{
	import com.kloke.model.types.KlokeEvent;

	public class SearchYouTubeEvent extends KlokeEvent
	{
		static public const EVENT_ID:String = "SearchYouTubeEvent";
		public function SearchYouTubeEvent()
		{
			super(EVENT_ID);
		}
		
	}
}