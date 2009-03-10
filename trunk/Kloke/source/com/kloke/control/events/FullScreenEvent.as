package com.iris.control.events
{
	import com.iris.model.types.IrisEvent;

	public class FullScreenEvent extends IrisEvent
	{
		static public const EVENT_ID:String = "fullscreen_event";
		public function FullScreenEvent()
		{
			super(EVENT_ID);
		}
		
	}
}