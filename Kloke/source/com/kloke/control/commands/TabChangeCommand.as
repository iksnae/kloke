package com.iris.control.commands
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.ICommand;
	import com.iris.model.types.IrisEvent;
	import com.iris.model.types.IrisEventType;
	import com.iris.util.debug.Debug;

	public class TabChangeCommand implements ICommand
	{
		public function TabChangeCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			Debug.log('Tab Changed @ '+event.caller+' to '+event.data)
			ApplicationData.getInstance().notify(IrisEventType.TAB_CHANGE, event)
		}
		
	}
}