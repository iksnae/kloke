package com.iris.util.helpers
{
	import flash.display.Sprite;
	
	public class ViewHelper
	{
		public function ViewHelper()
		{
		}
		static public function clearKids(view:Sprite):void{
			while( view.numChildren > 0 ){
				view.removeChild(view.getChildAt(0))
			}
		}

	}
}