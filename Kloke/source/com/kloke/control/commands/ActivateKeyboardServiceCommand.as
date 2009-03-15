package com.kloke.control.commands
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.services.KeyboardService;
	import com.kloke.model.types.KlokeEvent;

	public class ActivateKeyboardServiceCommand implements ICommand
	{
		public function ActivateKeyboardServiceCommand()
		{
		}

		public function execute(event:KlokeEvent):void
		{
			trace('ActivateKeyboardServiceCommand')
		    var service:KeyboardService = KeyboardService.getInstance();
            var data:ApplicationData = ApplicationData.getInstance()
            if(!data.keyBoardService) data.keyBoardService = service;
            service.open();
		      
		      
		}
		
	}
}