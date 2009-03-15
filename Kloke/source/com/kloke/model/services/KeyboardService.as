package com.kloke.model.services
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.IService;
	import com.kloke.model.types.KlokeEventType;
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;

	public class KeyboardService extends EventDispatcher implements IService
	{
		private var _data:ApplicationData = ApplicationData.getInstance()
		static private var _instance:KeyboardService=new KeyboardService();
		static public function getInstance():KeyboardService{
            return _instance;
        }
		
		public function KeyboardService()
		{
			if( _instance ) throw new Error( "KeyboardService is Singleton and can only be accessed through Singleton.getInstance()" );
	
		}
		
		public function get connected():Boolean
		{
			return false;
		}
		
		public function get status():String
		{
			return null;
		}
		
		public function open():void
		{
			Debug.log('KeyboardService.open')
		
			_data.app.stage.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown)
			_data.app.stage.addEventListener(KeyboardEvent.KEY_UP,onKeyUp)
            
			
		}
		public function close():void
        {
        	Debug.log('KeyboardService.close')
        	_data.app.stage.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
        	_data.app.stage.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
        }
		
		
		
		private function onKeyDown(e:KeyboardEvent):void{
			_data.notify(KlokeEventType.KEYBOARD_DOWN_EVENT, e)
		}
		private function onKeyUp(e:KeyboardEvent):void{
            _data.notify(KlokeEventType.KEYBOARD_UP_EVENT, e)
        }
		
	}
}