package com.kloke.model.types
{
	public class NameValuePair
	{
		private var _name:String;
		private var _value:Object;
		
		public function NameValuePair(name:String, value:Object)
		{
			_name=name;
			_value=value;
		}
		public function get name():String{
			return _name
		}
		public function get value():Object{
			return _value
		}

	}
}