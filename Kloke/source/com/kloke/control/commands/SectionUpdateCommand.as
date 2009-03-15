package com.kloke.control.commands
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.model.types.KlokeEventType;
	import com.kloke.util.debug.Debug;

	public class SectionUpdateCommand implements ICommand
	{
		public function SectionUpdateCommand()
		{
		}

		public function execute(event:KlokeEvent):void
		{
			Debug.info('SectionUpdateCommand: '+event.data)
			var str:String = event.data;
			var vars:Array = str.split('/')
			
			Debug.info('VARS: '+vars)
			ApplicationData.getInstance().notify(KlokeEventType.SECTION_CHANGE,vars)
            
          
		}
		
	}
}