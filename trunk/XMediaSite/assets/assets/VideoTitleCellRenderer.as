﻿package assets{	import fl.controls.listClasses.ICellRenderer;	import fl.controls.listClasses.ListData;		import flash.display.Loader;	import flash.display.MovieClip;	import flash.net.URLRequest;	import flash.text.TextField;	import flash.text.TextFormat;	public class VideoTitleCellRenderer extends MovieClip implements ICellRenderer	{				private var _textField:TextField;		private var _thumbView:Loader;					public function VideoTitleCellRenderer()		{			super();			graphics.beginFill(0x000000)			graphics.drawRect(0,0,700,90)			graphics.endFill()			_textField = new TextField()			_thumbView = new Loader()									_textField.selectable = false;			_textField.defaultTextFormat = new TextFormat('Arial',20,0xffffff)			_textField.text = 'Video Title'			_textField.x = 120;			_textField.width = 200;			addChild(_thumbView)			addChild(_textField)						_thumbView.load(new URLRequest('http://i2.ytimg.com/vi/AlHUYhhAq48/default.jpg'))						mouseChildren = false;					}						public function setSize(width:Number, height:Number):void		{		}				public function get listData():ListData		{			return new ListData('data',{},null,1,0,0);		}				public function set listData(value:ListData):void		{		}				public function get data():Object		{			return {};		}				public function set data(value:Object):void		{		}				public function get selected():Boolean		{			return false;		}				public function set selected(value:Boolean):void		{		}				public function setMouseState(state:String):void		{		}				public function set setStyle(style:*):void{					}		public function get setStyle():*{            return null;        }	}}