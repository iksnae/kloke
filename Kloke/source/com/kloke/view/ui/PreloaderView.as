package com.iris.view.ui
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.text.TextField;

	public class PreloaderView extends Sprite
	{
		private var _progressView:MovieClip;
		private var _progressText:TextField;
		private var _percent:Number

		
		public function PreloaderView()
		{
			super();
		}
		public function progressHandler(e:ProgressEvent):void{
			_percent = e.bytesLoaded/e.bytesTotal*100;
			_progressView.scaleX = _percent;
			_progressText.text = _percent+'%';
			if(_percent>99){
				onLoadComplete();
			}
		}
		
		
		public function get percent():Number{
			return _percent;
		}
		public function set progressView(mc:MovieClip):void{
			_progressView = mc
		}
		public function set progressText(tf:TextField):void{
			_progressText = tf
		}
		private function onLoadComplete():void{
			dispatchEvent(new Event('load_complete'))
		}
		
	}
}