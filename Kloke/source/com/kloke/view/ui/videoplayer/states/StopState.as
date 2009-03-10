package com.iris.view.ui.videoplayer.states
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IVideoControllerState;
	import com.iris.view.ui.videoplayer.VideoPlayerManager;
	import com.iris.view.ui.videoplayer.VideoPlayerView;

	public class StopState implements IVideoControllerState
	{
		private var _data:ApplicationData = ApplicationData.getInstance();
		private var _view:VideoPlayerView;
		public function StopState(view:VideoPlayerView)
		{
			_view = view;
		}

		public function playVideo():void
		{
			 _view.manager.setState(VideoPlayerManager.STATE_PLAY);
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
        	_view.playButton.visible  = true;
            _view.pauseButton.visible = false;
           // _view.stopButton.enabled = false;
        }
		
	}
}