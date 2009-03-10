package com.kloke.model.types
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	/**
	 * this class loads/stores the Image asset 
	 * @author khalid
	 * 
	 */	
	public class ImageAsset extends EventDispatcher
	{
		
		public var url:String;
		public var id:String;
		public var width:Number;
		public var height:Number;
		public var loaded:Boolean
		public var bitmap:BitmapData
		
		public function ImageAsset(obj:Object)
		{
			url = obj.url
			id = obj.id
			init()	
		}
		private function init():void{
			var req:URLRequest = new URLRequest(url)
			req.method = URLRequestMethod.GET;
			var loader:URLLoader = new URLLoader()
			loader.addEventListener(Event.COMPLETE,onComplete)
			loader.load(req)
		}
		private function onComplete(e:Event):void{
			loaded = true;
	
			
			dispatchEvent(new Event('ready'))
		}

	}
}