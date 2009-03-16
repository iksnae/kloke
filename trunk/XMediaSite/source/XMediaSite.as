package {
	import assets.VideoBrowser;
	
	import com.iksnae.xmedia.control.command.SearchYouTubeCommand;
	import com.iksnae.xmedia.control.command.VideoBrowserChangeCommand;
	import com.iksnae.xmedia.control.event.SearchYouTubeEvent;
	import com.iksnae.xmedia.control.event.VideoBrowserChangeEvent;
	
	import flash.events.NetStatusEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.system.Security;
	
	

	public class XMediaSite extends Kloke
	{
		public var vb:VideoBrowser;
		public var player:Video;
		
		private var _nc:NetConnection = new NetConnection()
		private var _ns:NetStream;
		

		
		public function XMediaSite()
		{
			super()
			
			Security.allowDomain('*.youtube.com')
			Security.allowInsecureDomain('*.youtube.com')
			Security.allowDomain('*.googlevideo.com')
			Security.allowDomain('*gdata.youtube.com')
			
			_nc.addEventListener(NetStatusEvent.NET_STATUS,onNetStatus)
			_nc.connect(null)
			
			_ns = new NetStream(_nc);
			player.attachNetStream(_ns)
			
			frontController.addCommand(VideoBrowserChangeEvent.EVENT_ID,VideoBrowserChangeCommand)
            frontController.addCommand(SearchYouTubeEvent.EVENT_ID,SearchYouTubeCommand)
          
     
		
		}
		private function onNetStatus(e:NetStatusEvent):void{
			trace(e.type)
		}
		public function playVideo(urs:String):void{
			
			_ns.play(urs+'flv')
	
		}
		
	}
}
