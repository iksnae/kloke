package com.kloke.control.commands
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.util.debug.Debug;
	
	import flash.external.ExternalInterface;

	public class SectionChangeCommand implements ICommand
	{
		public function SectionChangeCommand()
		{
		}

		public function execute(event:KlokeEvent):void
		{
			Debug.log('SectionChangeCommand: '+event.data)
			ApplicationData.getInstance().nextPage = event.data;
			ExternalInterface.call('SWFAddress.setValue',event.data);
		
		}
	}
}