package com.kloke.control.commands
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.services.KeyboardService;
	import com.kloke.model.types.IrisEvent;

	public class ActivateKeyboardServiceCommand implements ICommand
	{
		public function ActivateKeyboardServiceCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			trace('ActivateKeyboardServiceCommand')
		    var service:KeyboardService = KeyboardService.getInstance();
            var data:ApplicationData = ApplicationData.getInstance()
            if(!data.keyBoardService) data.keyBoardService = service;
            service.open();
		      
		      
		}
		
	}
}