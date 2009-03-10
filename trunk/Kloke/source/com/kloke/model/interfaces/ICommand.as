package com.kloke.model.interfaces
{
	import com.kloke.model.types.IrisEvent;
	
	public interface ICommand
	{
		function execute(event:IrisEvent):void;
	}
}