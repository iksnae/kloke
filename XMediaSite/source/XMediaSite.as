package {
	import assets.VideoBrowser;

	public class XMediaSite extends Kloke
	{
		private var vb:VideoBrowser;
		
		public function XMediaSite()
		{
			super()
			vb = new VideoBrowser()
			addChild(vb)
		}
	}
}
