package com.iris.control.events
{
	import com.iris.model.types.IrisEvent;

	public class ActivateKeyboardEvent extends IrisEvent
	{
		static public const EVENT_ID:String = 'activate_keyboard_event'
		public function ActivateKeyboardEvent()
		{
			super(EVENT_ID);
		}
		
	}
}