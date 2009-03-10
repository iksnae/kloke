package com.iris.control.commands
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.ICommand;
	import com.iris.model.services.KeyboardService;
	import com.iris.model.types.IrisEvent;

	public class DeactivateKeyboardServiceCommand implements ICommand
	{
		public function DeactivateKeyboardServiceCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			trace('DeactivateKeyboardServiceCommand')
			var service:KeyboardService = KeyboardService.getInstance();
			var data:ApplicationData = ApplicationData.getInstance()
			if(!data.keyBoardService) data.keyBoardService = service;
            service.close()
		}
		
	}
}