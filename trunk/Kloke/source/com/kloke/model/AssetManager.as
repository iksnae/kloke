package com.kloke.model
{
	import com.kloke.model.types.ImageAsset;
	import com.kloke.model.types.XMLAsset;
	import com.kloke.util.debug.Debug;
	
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.EventDispatcher;
	import flash.utils.Dictionary;
	/**
	 * this class will be responsible for laoding, storing + retreiving all external assets 
	 * @author khalid
	 * 
	 */
	public class AssetManager extends EventDispatcher
	{
		
		private var images:Dictionary = new Dictionary()
		private var xmls:Dictionary = new Dictionary()
		
		public function AssetManager()
		{
			super(null);
		}
		
		public function getImage(url:String):void{
			if(images[url]!=null){
				var imageObj:ImageAsset = new ImageAsset({url:url})
				images[url] = imageObj;
			}else{
				Debug.log('Image already loaded: '+url)
			}
		}
		public function getXML(url:String):void{
			if(xmls[url]!=null){
				var xmlObj:XMLAsset = new XMLAsset({url:url})
				xmls[url] = xmlObj;
			}else{
				Debug.log('XML already loaded: '+url)
			}
		}
		
		
		private function processImage(view:Loader):void{
        	var asset:ImageAsset = images[view.contentLoaderInfo.url]
        	trace(view.contentLoaderInfo.url)
        	trace('processImage. Store '+view+' data in '+asset);
        	asset.bitmap = view.content as BitmapData;
        }
		
		
	}
}