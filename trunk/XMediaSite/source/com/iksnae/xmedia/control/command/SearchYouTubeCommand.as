package com.iksnae.xmedia.control.command
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.util.debug.Debug;

	public class SearchYouTubeCommand implements ICommand
	{
		public function SearchYouTubeCommand()
		{
		}

		public function execute(event:KlokeEvent):void
		{
			Debug.log('Searching Youtube for:'+event.data)
			var app:XMediaSite = ApplicationData.getInstance().app as XMediaSite;
		

		}
		
	}
}