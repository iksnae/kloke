package com.iris.view.ui
{
	import com.iris.util.helpers.ViewHelper;
	
	import flash.display.Sprite;
	/**
	 *  this is a custom combox
	 * @author iksnae
	 * 
	 */
	public class ComboBoxView extends Sprite
	{
		private var _data:Array;
		private var _triggerView:Sprite;
		private var _menuView:Sprite;
		
		public function ComboBoxView()
		{
			super();
			_triggerView=new Sprite()
			_menuView = new Sprite()
		}
		
		
		public function set data(arr:Array):void{
			_data = arr
			ViewHelper.clearKids(_menuView)
		}
		
	}
}
	import flash.display.Sprite;
	
class ComboBoxEntry extends Sprite{
	public function Combobox(){init()}
	private function init():void{
		
	}
	
}