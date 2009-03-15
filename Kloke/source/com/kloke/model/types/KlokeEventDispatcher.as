package com.kloke.model.types
{
	import com.kloke.util.debug.Debug;
	
	import flash.events.EventDispatcher;

	public class KlokeEventDispatcher extends EventDispatcher
	{
		static private var _instance:KlokeEventDispatcher=new KlokeEventDispatcher();
		static public function getInstance():KlokeEventDispatcher{
            return _instance;
        }
		public function KlokeEventDispatcher()
		{
			if( _instance ) {
				throw new Error( "Singleton and can only be accessed through Singleton.getInstance()" );
				Debug.error("Singleton and can only be accessed through Singleton.getInstance()" )
			}
			
		}
		
	}
}
