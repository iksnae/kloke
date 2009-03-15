package com.kloke.model.interfaces
{
	import com.kloke.model.types.KlokeEvent;
	
	public interface ICommand
	{
		function execute(event:KlokeEvent):void;
	}
}