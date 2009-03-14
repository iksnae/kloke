package assets
{
	import fl.controls.listClasses.ListData;
	import fl.controls.listClasses.ICellRenderer;
	import flash.display.MovieClip;

	public class VideoHeaderRenderer extends MovieClip implements ICellRenderer
	{
		public function VideoHeaderRenderer()
		{
			super();
		
		}
	
		
		public function setSize(width:Number, height:Number):void
		{
		}
		
		public function get listData():ListData
		{
			return null;
		}
		
		public function set listData(value:ListData):void
		{
		}
		
		public function get data():Object
		{
			return null;
		}
		
		public function set data(value:Object):void
		{
		}
		
		public function get selected():Boolean
		{
			return false;
		}
		
		public function set selected(value:Boolean):void
		{
		}
		
		public function setMouseState(state:String):void
		{
		}
		
	}
}