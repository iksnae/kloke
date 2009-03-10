package com.iris.control
{
	import com.iris.control.events.TabChangeEvent;
	import com.iris.util.debug.Debug;
	import com.iris.view.ui.ButtonView;
	import com.iris.view.ui.navigation.TabbedNavigation;
	
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	public class TabbedNavControl extends EventDispatcher
	{
		
		public var selectedIndex:int = 0;
		public var currentTab:ButtonView;
		
		private var _view:TabbedNavigation;
		
		
		public function TabbedNavControl(view:TabbedNavigation)
		{
			Debug.log('TabbedNavControl instantiated')
			_view = view;
			
		}
		public function clickHandler(e:MouseEvent):void{
            Debug.log('tab click: '+e.currentTarget)
            var targ:ButtonView = e.currentTarget as ButtonView;
            for( var i:int=0;i< _view.numChildren; i++){
            	if(_view.getChildAt(i) is ButtonView){
	                var tab:ButtonView = _view.getChildAt(i) as ButtonView;
	                if(tab==targ){
	                	selectedIndex = i
	                	currentTab = tab;
	                }
                }
            }
            update()
        }
        public function update():void{
            for( var i:int=0;i< _view.numChildren; i++){
                if(_view.getChildAt(i) is ButtonView){
                    var tab:ButtonView = _view.getChildAt(i) as ButtonView;
                    if(selectedIndex == i){
                        tab.selected = true;
                        var tabEvt:TabChangeEvent = new TabChangeEvent()
                        tabEvt.caller = this;
                        tabEvt.data = tab.target;
                        tabEvt.dispatch()
                        
                    }else{
                        tab.selected = false;
                    }
                }
            }
        	
        }

	}
}