package com.iksnae.xmedia.control.command
{
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.IrisEvent;
	import com.kloke.util.debug.Debug;

	public class VideoBrowserChangeCommand implements ICommand
	{
		public function VideoBrowserChangeCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			Debug.log('VideoBrowserChangeCommand: '+event.data)
		}
		
	}
}