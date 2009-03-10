package com.iris.view.ui.videoplayer
{
	import com.iris.model.interfaces.IVideoControllerState;
	import com.iris.util.debug.Debug;
	import com.iris.view.ui.videoplayer.states.PauseState;
	import com.iris.view.ui.videoplayer.states.PlayState;
	import com.iris.view.ui.videoplayer.states.StopState;
	/**
	 * this class manages the video player and it's states.
	 * by using the "state pattern", each state of the 
	 * video player can have a completely different set
	 * instructions for the same method calls.
	 * 
	 * 
	 * 
	 * each state implements the IVideoControllerState interface.
	 * 
	 *
	 * @author iksnae
	 * @see IVideoControllerState
	 * 
	 */	
	public class VideoPlayerManager
	{
		
		private var _playState:IVideoControllerState;
		private var _pauseState:IVideoControllerState;
		private var _stopState:IVideoControllerState;
		private var _state:IVideoControllerState;
		
		
		static public const STATE_PLAY:String         = 'video_play_state'
		static public const STATE_PAUSE:String        = 'video_pause_state'
		static public const STATE_STOP:String         = 'video_stop_state'
		static public const STATE_BUFFERING:String    = 'video_buffering_state'
		
		
		
		public function VideoPlayerManager(view:VideoPlayerView)
		{
			Debug.log('VideoPlayerManager instantiated')
			_playState = new PlayState(view)
			_pauseState= new PauseState(view)
			
			_state = _pauseState;
			_state.update()
		}
		public function get state():IVideoControllerState{
			return _state;
		}
		public function setState(str:String):void{
			Debug.log('VideoPlayerManager.setState: '+str)
			switch(str){
				case STATE_PLAY:
				    _state = _playState;
				    _state.update()
				break;
				case STATE_PAUSE:
				    _state = _pauseState;
				    _state.update()
                break;
                case STATE_STOP:
                    _state = _stopState;
                    _state.update()
                break;
                case STATE_BUFFERING:
                    _state.update()
                break;
                
			}
		}
		
		public function get playState():IVideoControllerState{
			return _playState
		}
		public function get pauseState():IVideoControllerState{
			return _pauseState
		}
		

	}
}