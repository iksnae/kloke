package com.iris.model.types
{
	import com.iris.control.commands.ActivateKeyboardServiceCommand;
	import com.iris.control.commands.DeactivateKeyboardServiceCommand;
	import com.iris.control.events.ActivateKeyboardEvent;
	import com.iris.control.events.DeactivateKeyboardEvent;
	import com.iris.model.ApplicationData;
	
	public class AppConfig
	{
		
		private var _keyboard:Boolean;
		
		public function get keyboard():Boolean{
			return _keyboard;
		}
		public function set keyboard(bool:Boolean):void{
			_keyboard = 	bool;
			if(_keyboard){
				ApplicationData.getInstance().app.frame.frontController.addCommand(ActivateKeyboardEvent.EVENT_ID,ActivateKeyboardServiceCommand)
			}else{
				ApplicationData.getInstance().app.frame.frontController.addCommand(DeactivateKeyboardEvent.EVENT_ID,DeactivateKeyboardServiceCommand)
			}
		}
		
		public function AppConfig()
		{
		}

	}
}