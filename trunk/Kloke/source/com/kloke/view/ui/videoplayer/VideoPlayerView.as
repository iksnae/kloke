package com.iris.view.ui.videoplayer
{
	import caurina.transitions.Tweener;
	
	import com.iris.control.commands.VideoButtonClickCommand;
	import com.iris.control.events.VideoButtonClickEvent;
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IObserver;
	import com.iris.model.types.IrisEventType;
	import com.iris.util.debug.Debug;
	import com.iris.view.ui.ButtonView;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class VideoPlayerView extends Sprite implements IObserver
	{
		private var _data:ApplicationData = ApplicationData.getInstance();
		private var _controllerView:VideoControllerView;
		private var _id:String;
		
		
		
		
		
		private var _manager:VideoPlayerManager;
		public function VideoPlayerView()
		{
			super();
			Debug.log('VideoPlayerView instantiated');
			_controllerView = new VideoControllerView()
			_manager = new VideoPlayerManager(this)
			
			_data.app.frame.frontController.addCommand(VideoButtonClickEvent.EVENT_ID,VideoButtonClickCommand)
			_data.subscribe(IrisEventType.FULLSCREEN_CHANGE, this)
			
			
			_controllerView.y = 230;
			addChild(_controllerView)
			addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			
			
		}
		
		
		
		public function get playButton():ButtonView{ 		return _controllerView.playButton }
		public function get pauseButton():ButtonView{ 		return _controllerView.pauseButton }
		public function get stopButton():ButtonView{ 		return _controllerView.stopButton }
		public function get skipButton():ButtonView{ 		return _controllerView.skipButton }
		public function get prevButton():ButtonView{ 		return _controllerView.prevButton }
		public function get fullscreenButton():ButtonView{ 	return _controllerView.prevButton }
		public function get shareButton():ButtonView{ 		return _controllerView.shareButton }
		public function get volumeButton():ButtonView{      return _controllerView.volumeButton }
		public function get manager():VideoPlayerManager{   return _manager }
		
		public function get id():String{
            return _id
        }
        public function set id(str:String):void{
            _id= str
        }
		public function update(data:Object=null):void
        {
        	
        }
        public function hideController():void{
            Tweener.addTween(_controllerView,{time:1,alpha:0})
        }
        public function showController():void{
            Tweener.addTween(_controllerView,{time:1,alpha:1})
        }
        private function onMouseOver(e:MouseEvent):void{
        	showController()
        }
        private function onMouseOut(e:MouseEvent):void{
           hideController()
        }
		
	}
}