package com.kloke.control
{
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.IObserver;
	import com.kloke.model.interfaces.IPageView;
	import com.kloke.model.types.PageStates;
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;

	public class ViewController extends EventDispatcher implements IObserver
	{
		private var _appData:ApplicationData = ApplicationData.getInstance()
		public function ViewController()
		{
		}
		public var currentSection:String;
		public var currentURL:String;
		
		public function update(data:Object = null):void{
			Debug.info('ViewController: update: '+data)
		    
			try{
				var currentView:IPageView = _appData.app.getView(_appData.currentPage);
				var nextView:IPageView    = _appData.app.getView(_appData.nextPage);
				
				if(_appData.nextPage != _appData.currentPage) {
					Debug.log(currentView+' vs '+nextView)
					
					Debug.info('hide currentView: '+currentView);
					
					if(currentView){
					     currentView.hide();
					}else{
						if(nextView.state!=PageStates.OPEN){
						    showNext()
						}
				    }
				}
			}catch(err:*){
				
			}
			
		}
		/**
		 * this method called the hide() method on nextPage property of appdata.
		 * - if call fails, default page is called 
		 * 
		 */		
		public function showNext():void{
			var nextView:IPageView    = _appData.app.getView(_appData.nextPage);
			     Debug.info('show nextView: '+nextView)
			     
			     try{
			     	if(_appData.nextPage != _appData.currentPage) {
		     	        nextView.show()
		                _appData.currentPage = _appData.nextPage;
		      			}
		         
			     }catch(err:*){
		
			     	Debug.error('Could not show next page')
			     }
			
		}

	}
}