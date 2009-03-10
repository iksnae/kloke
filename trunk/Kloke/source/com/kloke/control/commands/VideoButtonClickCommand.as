package com.iris.control.commands
{
	import com.iris.control.events.VideoButtonClickEvent;
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.ICommand;
	import com.iris.model.types.IrisEvent;
	import com.iris.util.debug.Debug;

	public class VideoButtonClickCommand implements ICommand
	{
		private const PLAY_BTN:String = 'playButton'
		private const PAUSE_BTN:String = 'pauseButton'
        private const STOP_BTN:String = 'stopButton'
        private const SKIP_BTN:String = 'skipButton'
        private const PREV_BTN:String = 'prevButton'
        private const FS_BTN:String = 'fullscreenButton'
        private const SHARE_BTN:String = 'shareButton'
        
        
        
		public function VideoButtonClickCommand()
		{
		}

		public function execute(event:IrisEvent):void
		{
			var data:ApplicationData =ApplicationData.getInstance();
			var obj:VideoButtonClickEvent = VideoButtonClickEvent(event)
			Debug.log('VideoButtonClickEvent: '+obj.buttonName)
			switch(obj.buttonName){
				case PLAY_BTN:
				obj.videoView.manager.state.playVideo()
				
				break;
				case PAUSE_BTN:
				obj.videoView.manager.state.pauseVideo()
                break;
                case STOP_BTN:
                obj.videoView.manager.state.stopVideo()
                break;
                case SKIP_BTN:
                obj.videoView.manager.state.skipVideo()
                break;
                case PREV_BTN:
                obj.videoView.manager.state.prevVideo()
                break;
                case FS_BTN:
                break;
                case SHARE_BTN:
                break;
                
			}
		}
		
	}
}