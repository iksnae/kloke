package com.kloke.control.commands
{
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.util.debug.Debug;
	import com.kloke.util.swfaddress.SWFAddress;

	public class InitCommand implements ICommand
	{
		public function InitCommand()
		{
		}

		public function execute(event:KlokeEvent):void
		{
			var add:String = SWFAddress.getValue()
			SWFAddress.setValue(add)
			Debug.log("InitCommand: SWFAddress = "+add)
			
		}
	}
}