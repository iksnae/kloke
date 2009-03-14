package {
	import com.kloke.control.ViewController;
	import com.kloke.control.events.DeepRootEvent;
	import com.kloke.control.events.InitEvent;
	import com.kloke.model.ApplicationData;
	import com.kloke.model.interfaces.IPageView;
	import com.kloke.model.services.FrontController;
	import com.kloke.model.types.IrisEventType;
	import com.kloke.util.debug.Debug;
	import com.kloke.util.swfaddress.SWFAddress;
	import com.kloke.util.swfaddress.SWFAddressEvent;
	
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.Dictionary;
	/**
	 *  oooo        oooo            oooo                  
     *  `888        `888            `888                  
     *   888  oooo   888   .ooooo.   888  oooo   .ooooo.  
     *   888 .8P'    888  d88' `88b  888 .8P'   d88' `88b 
     *   888888.     888  888   888  888888.    888ooo888 
     *   888 `88b.   888  888   888  888 `88b.  888    .o 
     *   o888o o888o o888o `Y8bod8P' o888o o888o `Y8bod8P'
	 * 
	 * This is the starting point for all applications built on the Kloke Framework. 
	 * No modifications should be made to this class. When creating a new application
	 * you root doc class should extend this class. 
	 * 
	 * This provides a stateful environment with event handling and integration with deeproot linking.
	 * 
	 *   
	 *
	 * @author iksnae
	 * 
	 */
	public class Kloke extends Sprite
	{
	
		/**
		 * version number 
		 */		
		public const VERSION:String = '1.0'
		
		/**
		 * states 
		 */		
		
		public const ENABLED:String  = 'enabled'
		public const DISABLED:String = 'disabled'
		public const LOADING:String  = 'loading'
		
        
		/**
		 * state 
		 */		
		private var _state:String;
		
		/**
		 * application data 
		 * @ ApplicationData
		 */		
		private var _data:ApplicationData;
		
		
		private var _views:Dictionary;
		
		private var _autoInit:Boolean;

		
		
		/**
		 * main controller
		 * @see FrontController 
		 */		
	
		
		public var frontController:FrontController;
		
		
		/**
		 * view controller
		 */		
		public var viewController:ViewController;
		
		
		
		private function swfAddressHandler(e:SWFAddressEvent):void{
			var swfEvt:DeepRootEvent=new DeepRootEvent()
			swfEvt.data = e;
			swfEvt.dispatch()
			
		}
		
		
		/**
		 * class constructor
		 * - initiates the application data
		 * - calls init() method
		 */		
		public function Kloke(autoInit:Boolean=true)
		{
			Debug.info('KlokeFramework version: '+VERSION)
			_data  = ApplicationData.getInstance()
			_views = new Dictionary()
			_autoInit = autoInit;
			
			init()
		}
		
		
		
		/**
		 * initiation method
		 * - store reference to this in application data
		 * - initate frame view
		 * - add frame to stage 
		 * - calls addDefaultCommands() method
		 */		
		private function init():void{
			
			_data.app = this;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			frontController = new FrontController();
			viewController  = new ViewController()
			
			addEventListener(SWFAddressEvent.CHANGE, swfAddressHandler)
			SWFAddress.addEventListener(SWFAddressEvent.CHANGE,onSWFAddressChange)
			
			_data.subscribe(IrisEventType.SECTION_CHANGE, viewController)
			
			if(_autoInit){
				var intitEvt:InitEvent = new InitEvent()
	            intitEvt.dispatch()
            }
		}
		
		private function onSWFAddressChange(e:SWFAddressEvent):void{
			var evt:DeepRootEvent=new DeepRootEvent()
			evt.dispatch();
		}
		
	
		
		
		
		
		/**
         * exposes the application data as property
         * @return Frame
         * @see Frame
         */ 		
		public function get data():ApplicationData{
			return _data;
		}
		
		
		
		
		
		
		
		
		
		public function addPage(page:IPageView, id:String):void{
			if(!_views[id]){
				_views[id] = page;
				page.addEventListener(IrisEventType.HIDE_PAGE_COMPLETE, onPageHideComplete)
				page.addEventListener(IrisEventType.SHOW_PAGE_COMPLETE, onPageShowComplete)
				_data.subscribe(IrisEventType.SECTION_CHANGE,page)
			    addChild(page as Sprite)
			    Debug.log('addPage:'+page+' as '+id)
			   
			}else{
				Debug.error('page already added')
			}
			
		}
		private function onPageHideComplete(e:Event):void{
		//	Debug.info('onPageHideComplete: '+e.currentTarget)
			viewController.showNext()
		}
		private function onPageShowComplete(e:Event):void{
         //   Debug.info('onPageShowComplete: '+e.currentTarget)
        }
        public function getView(id:String):IPageView{
        	//Debug.info('getting view by id: '+id+ ' ? '+_views[id])
        	return _views[id]
        }
		
		
	
		
	}
}
