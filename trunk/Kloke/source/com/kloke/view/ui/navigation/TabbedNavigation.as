package com.iris.view.ui.navigation
{
	import com.iris.control.TabbedNavControl;
	import com.iris.control.commands.TabChangeCommand;
	import com.iris.control.events.TabChangeEvent;
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IObserver;
	import com.iris.model.types.IrisEventType;
	import com.iris.util.debug.Debug;
	import com.iris.view.ui.ButtonView;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class TabbedNavigation extends Sprite implements IObserver
	{
		private var _id:String;
		private var _control:TabbedNavControl;
		private var _data:ApplicationData = ApplicationData.getInstance()
		
		/**
		 * array to store reference to all tabs 
		 */		
		private var _tabs:Array;
		private var _titles:Array;
		private var _targets:Array;
		
		
//		private var _btnStyle:IButtonStyle = new ButtonViewTextStyle();
		
		
		public function TabbedNavigation()
		{
			//TODO: implement function
			super();
			Debug.log('TabbedNavigation instantiated')
			_data.app.frame.frontController.addCommand(  TabChangeEvent.EVENT_ID, TabChangeCommand)
			_data.subscribe( IrisEventType.CHANGE_TAB,    this)
			_data.subscribe( IrisEventType.SECTION_CHANGE,this)
			init();
		}
		
		public function update(data:Object=null):void
		{
			for each(var tab:ButtonView in _tabs){
				tab.update(data);
			}
		}
		
		public function get currentTab():ButtonView{
			return _control.currentTab
		}
		public function get selectedIndex():int{
			return _control.selectedIndex
		}
		public function get tabs():Array{
			return _tabs
		}
		public function get control():TabbedNavControl{
			return _control
		}
		/**
		 * this method allows runtime configuration of the ids to be passed as arguments to the TabChangeEvent 
		 * @param arr
		 * 
		 */		
		public function set targets(arr:Array):void{
			_targets = arr
		}
		public function set titles(arr:Array):void{
			_titles = arr;
		}
		
		private function init():void{
			_tabs = new Array()
			_control = new TabbedNavControl(this)
			for( var i:int=0;i<numChildren; i++){
				if( getChildAt(i) is ButtonView){
					var tab:ButtonView = getChildAt(i) as ButtonView;
					tab.addEventListener(MouseEvent.CLICK,_control.clickHandler)
					tab.target = tab.name;
	//				tab.applyStyle(_btnStyle)
					tab.label = 'Button '+i;
					_tabs.push(tab)
				}
			}
			if(_tabs.length<1) Debug.error('No Tabs found')
			
			_control.update()
			
			
		}
		
        public function get id():String{
            return _id
        }
        public function set id(str:String):void{
            _id= str
        }
		
	}
}

