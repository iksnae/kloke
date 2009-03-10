package com.iris.util.helpers
{
	import flash.utils.Dictionary;
	
	public class TweenerAnimations
	{
		public function TweenerAnimations()
		{
		}
		static public function FadeOut(time:Number=1,options:Object=null):Object{
			if(options){
				var object:Object=new Object()
				var labels:Array=new Array()
				var values:Array=new Array()
				// to be implemented
			}
			return {time:time,alpha:0}
		}
		static public function FadeIn(time:Number=1,options:Object=null):Object{
            if(options){
                var object:Object=new Object()
                var labels:Array=new Array()
                var values:Array=new Array()
                // to be implemented
            }
            return {time:time,alpha:1}
        }
        static public function HideCurrent():Object{
        	return {time:2,x:-100,scaleX:.58,scaleY:.58}
        }
        static public function ShowCurrent():Object{
            return {time:2,x:200,scaleX:2,scaleY:2, transition:'easeInOutQuart'}
        }
        

	}
}