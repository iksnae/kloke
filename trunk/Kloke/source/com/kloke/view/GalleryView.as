package com.iris.view
{
	import com.iris.model.interfaces.IObserver;
	import com.iris.util.debug.Debug;
	import com.iris.view.ui.ModuleView;
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.Dictionary;

	public class GalleryView extends ModuleView implements IObserver
	{
		
		
		static public const TYPE_DEFAULT:String = 'default'
		static public const TYPE_FLICKR:String  = 'flickr'
		static public const TYPE_PICASA:String  = 'picasa'
		static public const TYPE_RSS:String 	= 'rss'
		
		private var _entries:Dictionary;
		private var _entryIDs:String;
		private var _current:int;
		private var _type:String;
		private var _xmlLoader:URLLoader;
		private var _imgLoader:Loader;
		private var _xmlLocation:String;
		private var _galleryXML:XML;
		
		
		private var _id:String;
		/**
		 * 
		 * @param type//argumets tagging is great. Be sure to document as you go Team//
		 * @param xmlURL
		 * 
		 */		
		public function GalleryView(type:String = TYPE_DEFAULT, xmlURL:String )
		{
			super();
			_type = type;
			_xmlLocation = xmlURL;
			_entries = new Dictionary()
			init()
		}
		
		
		protected function init():void{
			var req:URLRequest=new URLRequest(_xmlLocation)
			req.method = URLRequestMethod.GET;
			_xmlLoader = new URLLoader()
			_xmlLoader.addEventListener(Event.COMPLETE,xmlLoaded)
			switch(_type){
				case TYPE_DEFAULT:
				_xmlLoader.load(req);
				break;
				case TYPE_FLICKR:
				break;
				case TYPE_PICASA:
				break;
				case TYPE_RSS:
				_xmlLoader.load(req);
				break;
			}
			
			
		}
		
		public function get id():String{ return _id }
		public function set id(str:String):void{_id=str }
		public function get entries():Dictionary{ return _entries }
		
		public function update(data:Object=null):void
		{
			
		}
		public function next():void{
			
		}
		public function prev():void{
			
		}
		
		
		private function xmlLoaded(e:Event):void{
			Debug.log('Gallery XML Loaded')
			_galleryXML = XML(_xmlLoader.data);
			Debug.log(_galleryXML)
			switch(_type){
				case TYPE_DEFAULT:
			
				break;
				case TYPE_FLICKR:
				break;
				case TYPE_PICASA:
				break;
				case TYPE_RSS:
			
				break;
			}
			
		}
		private function onFlickrLoaded():void{
			
		}
	}
}