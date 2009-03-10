package com.kloke.model.services
{
	import com.kloke.control.commands.DeepRootCommand;
	import com.kloke.control.commands.InitCommand;
	import com.kloke.control.commands.SectionChangeCommand;
	import com.kloke.control.commands.SectionUpdateCommand;
	import com.kloke.control.events.DeepRootEvent;
	import com.kloke.control.events.InitEvent;
	import com.kloke.control.events.SectionChangeEvent;
	import com.kloke.control.events.SectionUpdateEvent;
	import com.kloke.model.interfaces.ICommand;
	import com.kloke.model.types.IrisEvent;
	import com.kloke.model.types.IrisEventDispatcher;
	import com.kloke.util.debug.Debug;
	
	import flash.utils.Dictionary;
	
	public class FrontController
	{
		public const VERSION:String = '1.0'
		protected var commands:Dictionary=new Dictionary();
		
		
		public function FrontController()
		{
			Debug.info('FrontController ver. '+VERSION)
			init()
		}
		public function addCommand(eventName:String, commandRef:Class, useWeakReference:Boolean=true):void{
            if(commands[eventName]!=null) throw new Error('Command Already Registered')
            Debug.info('add command: ' + eventName )
            commands[ eventName ] = commandRef;
            IrisEventDispatcher.getInstance().addEventListener( eventName, executeCommand,false,0, useWeakReference)
           
        }
        private function executeCommand(e:IrisEvent):void{
            var cmd:Class = getCommand(e.type);
            var exe:ICommand = new cmd();
            exe.execute(e)
        }
        private function getCommand(id:String):Class{
            var cmd:Class = commands[id];
            if(cmd!=null){
                return cmd;
            }
            throw new Error('No Command Found')
            return null;
        }
        private function init():void{
        	addCommand(InitEvent.EVENT_ID,InitCommand)
        	addCommand(DeepRootEvent.EVENT_ID,DeepRootCommand)
            addCommand(SectionChangeEvent.EVENT_ID,SectionChangeCommand)
            addCommand(SectionUpdateEvent.EVENT_ID,SectionUpdateCommand)
        }

	}
}