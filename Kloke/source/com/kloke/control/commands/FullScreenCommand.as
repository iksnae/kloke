package com.iris.control.commands
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.ICommand;
	import com.iris.model.types.IrisEvent;
	import com.iris.model.types.IrisEventType;

	public class FullScreenCommand implements ICommand
	{
		public function FullScreenCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			ApplicationData.getInstance().notify(IrisEventType.FULLSCREEN_CHANGE)
		}
		
	}
}