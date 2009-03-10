package com.iris.model.interfaces
{
	import flash.text.TextFormat;
	
	public interface IButtonStyle
	{
		function get overStyle():TextFormat;
		function get outStyle():TextFormat;
		function get disableStyle():TextFormat;
        function get selectedStyle():TextFormat;
        
	}
}