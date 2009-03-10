package com.iris.model.interfaces
{
	public interface IVideoControllerState
	{
		function playVideo():void;
		function pauseVideo():void;
		function stopVideo():void;
		function skipVideo():void;
		function prevVideo():void;
		function shareVideo():void;
		function toggleFullscreen():void;
		function update():void;
	}
}