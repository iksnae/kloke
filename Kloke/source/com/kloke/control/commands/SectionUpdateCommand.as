package com.kloke.control.commands
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.IrisEvent;
	import com.kloke.model.types.IrisEventType;
	import com.kloke.util.debug.Debug;

	public class SectionUpdateCommand implements ICommand
	{
		public function SectionUpdateCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			Debug.info('SectionUpdateCommand: '+event.data)
			var str:String = event.data;
			var vars:Array = str.split('/')
			
			Debug.info('VARS: '+vars)
			ApplicationData.getInstance().notify(IrisEventType.SECTION_CHANGE,vars)
            
          
		}
		
	}
}