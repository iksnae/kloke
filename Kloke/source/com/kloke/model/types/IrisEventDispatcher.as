package com.kloke.model.types
{
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;

	public class IrisEventDispatcher extends EventDispatcher
	{
		static private var _instance:IrisEventDispatcher=new IrisEventDispatcher();
		static public function getInstance():IrisEventDispatcher{
            return _instance;
        }
		public function IrisEventDispatcher()
		{
			if( _instance ) {
				throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );
				Debug.error("Singleton and can only be accessed through Singleton.getInstance()" )
			}
			
		}
		
	}
}
