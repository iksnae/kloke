package com.iris.control.events
{
	import com.iris.model.types.IrisEvent;

	public class DeactivateKeyboardEvent extends IrisEvent
	{
		static public const EVENT_ID:String = 'deactivate_keyboard_event'
		public function DeactivateKeyboardEvent()
		{
			super(EVENT_ID);
		}
		
	}
}