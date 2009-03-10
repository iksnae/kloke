package com.iris.control.events
{
	import com.iris.model.types.IrisEvent;
	import com.iris.view.ui.videoplayer.VideoPlayerView;

	public class VideoButtonClickEvent extends IrisEvent
	{
		static public const EVENT_ID:String = 'VideoButtonClickEvent'
		public function VideoButtonClickEvent()
		{
			super(EVENT_ID);
		}
		public var buttonName:String;
		public var videoView:VideoPlayerView;
		
	}
}