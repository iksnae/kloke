package com.iris.view.ui
{
	import com.iris.model.ApplicationData;
	import com.iris.model.interfaces.IController;
	
	import flash.display.Sprite;
	import flash.errors.IllegalOperationError;

	public class ComponentView extends Sprite
	{
		public var children:Array;
		public var model:Object
		public var controller:Object;
		
		
		public function ComponentView(model:ApplicationData, controller:IController)
		{

			this.model 		= model;
			this.controller = controller;
		
		}
		
		public function addModule(m:ModuleView):void{
			throw new IllegalOperationError("addModule operation not supported")
		}
		public function removeModule(m:ModuleView):void{
			throw new IllegalOperationError("removeModule operation not supported")
		}
		public function getModule():ModuleView{
			throw new IllegalOperationError("getModule operation not supported")
		}
		public function update(event:*=null):void{}
		
	}
}