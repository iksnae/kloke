package com.iris.control.events
{
	import com.iris.model.types.IrisEvent;

	public class TabChangeEvent extends IrisEvent
	{
		static public const EVENT_ID:String = 'TabChangeEvent'
		public function TabChangeEvent()
		{
			super(EVENT_ID);
		}
		
	}
}