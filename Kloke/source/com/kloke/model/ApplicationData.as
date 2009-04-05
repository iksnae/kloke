package  com.kloke.model
{
	import com.kloke.model.interfaces.IModel;
	import com.kloke.model.interfaces.IObserver;
	import com.kloke.model.services.KeyboardService;
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;
	import flash.events.StatusEvent;
	import flash.net.LocalConnection;
	import flash.utils.Dictionary;
	/**
	 * This is the Model for the application. All data related to the application resides and
	 * is accessed here. This is a Singleton object annd must be accessed via:
	 * ApplicationData.getInstance()
	 * 
	 * This object also implments the ISubject interface, enabling the Observer Pattern methods:
	 * subscribe()
	 * unSubscribe()
	 * notify()
	 * 
	 * 
	 * @author khalid
	 * 
	 */
	public dynamic class ApplicationData extends EventDispatcher implements IModel
	{
		
		
		/**
		 * dictionary for storing observers/retreiving listening for events 
		 */
		private var observers:Dictionary=new Dictionary()
		
		
		
		
		/**
		 * dictionary for storing/retreiving views 
		 */		
		private var _views:Dictionary = new Dictionary()
		
		
		
		
		/**
		 * instantiation: singleton enforced
		 */		
		static private var _instance:ApplicationData = new ApplicationData();
		static public function getInstance():ApplicationData{
			return _instance;
		}
		
		
		// constructor
		public function ApplicationData()
		{
		      inboundLC = new LocalConnection()
		      inboundLC.allowDomain('*');
              inboundLC.client = this;
		      inboundLC.addEventListener(StatusEvent.STATUS,onLCStatus)
		    //  inboundLC.connect("air_tracer");
		      outboundLC = new LocalConnection()
		      outboundLC.addEventListener(StatusEvent.STATUS,onLCStatus)
		     // localConnection.connect('FlashTracerAIR')
		}
		
		
		
		
		////////////////////////////////
		//////  PUBLIC  PORPERTIES
		////////////////////////////////
		public var keyBoardService:KeyboardService;
		public var app:Kloke;
		public var assetManager:AssetManager;
		public var currentPage:String='PAGE NOT SET';
		public var nextPage:String = 'PAGE NOT SET';
		public var defaultPage:String;
		
		
		
		/**
		 * this method is inherited from the ISubject interface.
		 * - checks to see if there's an event registered
		 * - if the event is registered, the observer is stored
		 * - else the event is registered, then the observer is stored
		 * @param eventName
		 * @param observer
		 * @see ISubject
		 */		
		public function subscribe(eventName:String,observer:IObserver):void{
			var obs:Array;
			if(observers[eventName]!=null){
				obs = observers[eventName];
				Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName,{eventName:eventName});
			}else{
				Debug.log('No Observers for: '+ eventName +' so a list was created.');
				obs = new Array();
				observers[eventName] = obs;
			}
			Debug.log('Storing '+observer+' for "'+eventName+'" event',{observer:observer,eventName:eventName})
			obs.push(observer);
		}
		
		
		
		/**
		 * this method is inherited from the ISubject interface.
		 * - checks for observer/eventName pair
		 * - if found, item is removed from array ( still needs to be removed from dictionary object )
		 * 
		 * @param eventName
		 * @param observer
		 */		
		public function unSubscribe(eventName:String,observer:IObserver):void{
			var obs:Array;
			if(observers[eventName]!=null){
				obs = observers[eventName];
				Debug.log('Found ('+observers[eventName].length+') Observers for: '+ eventName);
				for(var ob:int = 0; ob < obs.length; ob++){
					if(obs[ob]==observer){
						obs.splice(ob,1)
						break;
					}
				}
			}else{
				Debug.log('No Observers for: '+ eventName);
			}
		}
		
		
		
		/**
		 * this method is inherited from the ISubject interface.
		 * - notifies all observers of the specified eventName
		 * @param event
		 * @param data
		 */		
		public function notify(eventName:String, data:*=null):void{
			var list:Array;
			if(observers[eventName]!=null){
				list = observers[eventName];
				Debug.log('('+list.length+') Observers Found')
				for(var ob:int = 0; ob < list.length; ob++){
				//	Debug.log('('+ob+') Found: '+list[ob])
					list[ob].update(data)
				}
			}else{
				Debug.log('No Observers for: '+ eventName,eventName);
			}
		}
		
		
		
		
		
	
		
		
		
		/**
		 * this property controls the output of debug/trace output.
		 * - simplifies, transition from development to production stages 
		 */		
		public var debugMode:Boolean = true;
		public var firebugMode:Boolean = false;
		
		
		public var inboundLC:LocalConnection = new LocalConnection();
        public var outboundLC:LocalConnection = new LocalConnection();
         
		private function onLCStatus(event:StatusEvent):void {
            switch (event.level) {
                case "status":
                    trace("LocalConnection.send() succeeded");
                    break;
                case "error":
                    trace("LocalConnection.send() failed");
                    break;
            }
        }
	}
}