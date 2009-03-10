package com.iris.view.ui
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class CheckBoxView extends MovieClip
	{
		private var _selected:Boolean;
		
		public function CheckBoxView()
		{
			super();
			buttonMode=true
			addEventListener(MouseEvent.CLICK,clickHandler)
		}
		
		public function get selected():Boolean{
			return _selected;
		}
		private function clickHandler(e:MouseEvent):void{
			if(_selected){
				_selected=false;
				gotoAndStop(1)
			}else{
				_selected=true;
				gotoAndStop(2)
			}
		}
		
	}
}