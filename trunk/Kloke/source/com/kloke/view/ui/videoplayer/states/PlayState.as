package com.iris.view.ui.videoplayer.states
{
	import com.iris.model.interfaces.IVideoControllerState;
	import com.iris.view.ui.videoplayer.VideoPlayerManager;
	import com.iris.view.ui.videoplayer.VideoPlayerView;

	public class PlayState implements IVideoControllerState
	{
		private var _view:VideoPlayerView;
		
		public function PlayState(view:VideoPlayerView)
		{
			_view = view;
		}

		public function playVideo():void
		{
		 
		  
		}
		
		public function pauseVideo():void
		{
			_view.manager.setState(VideoPlayerManager.STATE_PAUSE);
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
         //   _view.stopButton.enabled = true;
        }
	}
}