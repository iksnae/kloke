package com.iris.view
{
	import com.iris.control.events.InitEvent;
	import com.iris.model.services.FrontController;
	import com.iris.util.debug.Debug;
	
	import flash.display.Sprite;
	/**
	 * this class is the main application view.
	 *  
	 * @author iksnae
	 * 
	 */
	public class Frame extends Sprite
	{
		private var _frontController:FrontController;
		/**
		 * constructor 
		 * - initiatiates the FrontController
		 */		
		public function Frame()
		{
			super();
			_frontController = new FrontController()
		   init()	
		
		}
		/**
		 * exposes the FrontController 
		 * @return 
		 * 
		 */		
		public function get frontController():FrontController{
			return _frontController;
		}
		/**
		 * initiation method
		 */		
		private function init():void{
			var intitEvt:InitEvent = new InitEvent()
			intitEvt.dispatch()
		}
		/**
         * TO BE IMPLEMENTED 
         * @param view
         * 
         */     
        public function addView(view:Sprite):void{
            addChild(view)
        }
        /**
         * TO BE IMPLEMENTED 
         * @param view
         * 
         */ 
        public function removeView(view:Sprite):void{
        	removeChild(view)
        }
	}
}