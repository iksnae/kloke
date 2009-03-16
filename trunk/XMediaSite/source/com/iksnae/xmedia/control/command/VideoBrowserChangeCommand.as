package com.iksnae.xmedia.control.command
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.KlokeEvent;
	import com.kloke.util.debug.Debug;
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;

	public class VideoBrowserChangeCommand implements ICommand
	{
		public function VideoBrowserChangeCommand()
		{
		}
		private var ytGetter:String = 'http://iksnae.com/brandx/ripper.php?url='

		public function execute(event:KlokeEvent):void
		{
			Debug.log('VideoBrowserChangeCommand: '+event.data.id)
			
			var loader:URLLoader = new URLLoader()
			loader.addEventListener(Event.COMPLETE,onComplete)
			loader.addEventListener(IOErrorEvent.IO_ERROR,onError)
			loader.load(new URLRequest(ytGetter+event.data.id))
			
		}
		private function onComplete(e:Event):void{
			Debug.info("YouTube Video Data Loaded: "+URLLoader(e.target).data);
			var app:XMediaSite = ApplicationData.getInstance().app as XMediaSite;
			app.playVideo(URLLoader(e.target).data);
			
		}
		private function onError(e:IOErrorEvent):void{
            Debug.error("YouTube Video Data Failed to Load");
        }
		
	}
}