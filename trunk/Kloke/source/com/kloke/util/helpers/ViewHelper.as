package com.kloke.util.helpers
{
    import flash.display.DisplayObject;
    /**
     * this is a set of methods for helping views. 
     * the methods are static
     * @author iksnae
     * 
     * 
     * clearKids(momView):void
     * checkIfInArray(targetItem, targetArray):Boolean
     * 
     * 
     * 
     */ 
    public class ViewHelper
    {
        
        public function ViewHelper()
        {
        }
        /**
         * this method removes all the children in a view 
         * @param view        : the DisplayObject to clear of child views
         * 
         */     
        static public function clearKids(momView:DisplayObject):void{
            while( momView.numChildren > 0 ){
                momView.removeChild(view.getChildAt(0))
            }
        }
        /**
         * this method checks an array to see if a specific item is in the array + returns a boolean
         * @param targetItem  : the target item to look for
         * @param targetArray : the array to search
         * @return            : if found
         * 
         */     
        static public function checkIfInArray(targetItem:Object, targetArray:Array):Boolean{
            var bool:Boolean;
            for(var i:int = 0; i<targetArray.length; i++){
                var targ:Object = targetArray[i];
                if(targ == targetItem) bool = true;
            }
            return bool
        }
        
        

    }
}