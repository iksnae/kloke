package com.iris.model.types
{
	import com.iris.model.interfaces.IButtonStyle;
	
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	public class ButtonViewTextStyle implements IButtonStyle
	{
		
		public var font:String        = "ARIAL";
		public var size:Number        = 12;
		public var align:String       = TextFormatAlign.CENTER;
		public var bold:Boolean       = false;
		public var italic:Boolean     = false;
		public var underline:Boolean  = false;
		
		
		public var overColor:uint = 0x000000;
		public var outColor:uint = 0xffffff;
		public var disableColor:uint = 0x666666;
		public var selectedColor:uint = 0xffffff;
		
		public function ButtonViewTextStyle()
		{
			
		}

		public function get overStyle():TextFormat
		{
			return new TextFormat(font,size,overColor,bold,italic,underline,null,align)
		}
		
		public function get outStyle():TextFormat
		{
			return new TextFormat(font,size,outColor,bold,italic,underline,null,align)
		}
		
		public function get disableStyle():TextFormat
		{
			return new TextFormat(font,size,disableColor,bold,italic,underline,null,align)
		}
		
		public function get selectedStyle():TextFormat
		{
			return new TextFormat(font,size,selectedColor,bold,italic,underline,null,align)
		}
		
	}
}