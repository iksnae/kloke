package com.iris.view.ui.videoplayer.states
{
	import com.iris.model.interfaces.IVideoControllerState;
	import com.iris.view.ui.videoplayer.VideoPlayerView;

	public class BufferingState implements IVideoControllerState
	{
		private var _view:VideoPlayerView
		
		public function BufferingState()
		{
		}

		public function playVideo():void
		{
		}
		
		public function pauseVideo():void
		{
		}
		
		public function stopVideo():void
		{
		}
		
		public function skipVideo():void
		{
		}
		
		public function prevVideo():void
		{
		}
		
		public function shareVideo():void
		{
		}
		
		public function toggleFullscreen():void
		{
		}
		
		public function update():void
		{
			_view.playButton.visible  = false;
            _view.pauseButton.visible = true;
            _view.pauseButton.enabled = false;
            _view.stopButton.enabled = true;
		}
		
	}
}