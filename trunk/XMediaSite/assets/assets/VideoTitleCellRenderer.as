﻿package assets{	import com.iksnae.xmedia.control.event.VideoBrowserChangeEvent;	import com.kloke.model.types.VideoDataObject;		import fl.containers.UILoader;	import fl.controls.Button;	import fl.controls.listClasses.CellRenderer;		import flash.display.MovieClip;	import flash.events.MouseEvent;	import flash.text.TextField;	public class VideoTitleCellRenderer extends CellRenderer	{				public var title_txt:TextField;		public var description_txt:TextField;		public var search_btn:Button;		public var thumb_holder:UILoader;		public var over_state:MovieClip;		public var out_state:MovieClip;        public var disable_state:MovieClip;        				private var _isSelected:Boolean;		private var _myData:VideoDataObject;						public function VideoTitleCellRenderer()		{			super();					addEventListener(MouseEvent.CLICK,clickHandler)			//mouseEnabled = false;			mouseChildren = false;			buttonMode = true;					}		private function clickHandler(e:MouseEvent):void{			var evt:VideoBrowserChangeEvent = new VideoBrowserChangeEvent()			evt.data = _myData			evt.dispatch();		}		override public function set selected(bool:Boolean):void{			_isSelected=bool			//Debug.log(name+' selected: '+_isSelected)            if(_isSelected){                               disable_state.visible = false;                over_state.visible = true;                out_state.visible = false                         }else{                            over_state.visible = false;                out_state.visible = true                            }		}		override public function set data(value:Object):void{		//    Debug.log(value)					_myData = VideoDataObject(value)			title_txt.text           = _myData.title;			description_txt.text     = _myData.description;			thumb_holder.source      = _myData.thumb;		}				        	}}