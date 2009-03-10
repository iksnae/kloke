package com.iris.view.ui
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IPageView;
	import com.iris.model.types.PageStates;
	
	import flash.display.Sprite;

	public class PageView extends Sprite implements IPageView
	{
		private var _active:Boolean;
		private var _state:String = PageStates.CLOSED;
		public var appData:ApplicationData = ApplicationData.getInstance();
		public function PageView()
		{
			super();
			
			visible = false;
			hide()
		}
		
		public function update(data:Object=null):void
		{
		}
		
		public function get state():String
		{
			return _state;
		}
		public function set state(s:String):void
        {
            _state=s;
        }
		
		public function get active():Boolean{
			return _active
		}
		public function set active(bool:Boolean):void{
			_active = bool;
			if(_active){
				_state = PageStates.OPEN;
				visible = true;
			}else{
				_state = PageStates.CLOSED;
				visible = false;
			}
		}
		
		public function hide():void{}
        public function show():void{}
        
        
      
		
	}
}