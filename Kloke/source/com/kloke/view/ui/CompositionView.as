package com.iris.view.ui
{
	import com.iris.control.ViewController;
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IObserver;
	import com.iris.model.types.IrisEventType;
	
	import flash.display.Sprite;
	/**
	 * this view-based class manages and references a compostion of modules. an
	 * example of this class in action is a page with one or more ModuleViews.
	 * 
	 * upon instantiation, the super class constructor is applied and the following
	 * inherited methods are over-written:
	 * addModule()
	 * removeModule()
	 * getModule()
	 * update()
	 * 
	 *  
	 * @author khalid
	 * 
	 */
	public class CompositionView extends Sprite implements IObserver
	{
		// this array stores refernces of added child ModuleViews
		private var _children:Array;
		private var _control:ViewController;
		private var _id:String
		
		// constructor
		public function CompositionView(model:ApplicationData, controller:ViewController)
		{
			super();
			_children = new Array()
			_control  = controller;
			model.subscribe(IrisEventType.UPDATE,this)
		}
		/**
		 * this method stores a reference to the added ModuleView 
		 * @param m
		 * 
		 */		
		public function addModule(m:ModuleView):void{
			_children.push(m);
		}
		public function removeModule(m:ModuleView):void{
			var index:int = 0;
			for each( var mod:ModuleView in  _children){
				if(mod==m){
					_children.splice(index,1);
				}
				index++
			}
		}
		
		public function update(event:Object=null):void{
			for each( var mod:ModuleView in  _children){
				mod.update(event);
			}
		}
		public function get id():String{return _id};
		public function set id(str:String):void{};
		
		
		public function hide():void{
			
		}
		public function show():void{
			
		}
		
	}
}