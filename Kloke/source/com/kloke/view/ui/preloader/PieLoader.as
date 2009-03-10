package com.iris.view.ui.preloader
{
	import com.theflashblog.drawing.Wedge;
	import flash.display.Sprite;

	public class PieLoader extends Sprite
	{
		public var lineWeight:Number = 0;
		public var lineColor:uint    = 0x000000;
		public var fillColor:uint    = 0xffffff;
		
		public function PieLoader()
		{
			super();
		}
		public function set percent(perc:Number):void{
			graphics.clear()
			graphics.lineStyle(lineWeight,lineColor);
			graphics.beginFill(fillColor)
			Wedge.draw(this, 350, 200, perc,0)
		}
	}
}