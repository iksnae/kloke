package {
	import assets.VideoBrowser;
	
	import com.iksnae.xmedia.control.command.VideoBrowserChangeCommand;
	import com.iksnae.xmedia.control.event.VideoBrowserChangeEvent;
	
	

	public class XMediaSite extends Kloke
	{
		public var vb:VideoBrowser;
		
		public function XMediaSite()
		{
			super()
			frontController.addCommand(VideoBrowserChangeEvent.EVENT_ID,VideoBrowserChangeCommand)
            
		
		}
	}
}
