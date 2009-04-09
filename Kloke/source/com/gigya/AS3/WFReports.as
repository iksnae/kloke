package com.gigya.AS3 {
    
    public class WFReports {
        import flash.display.DisplayObject;
        import flash.display.Loader;
        import flash.display.MovieClip; 
        import flash.events.Event;
        import flash.net.URLLoader;
        import flash.net.URLRequest;
        import flash.system.Security;
        import flash.utils.Timer;
        import flash.display.LoaderInfo;
        private static var _pendingEventsQueue:Object={};
        private static var _head:Number=0; // where the next event should be added
        private static var _tail:Number=0; // the last already reported event
        
        private static var _dynamicReporterMC:MovieClip;
        private static var _lastDynamicReporterLoadAttemtTime:Number=0;
        
        private static var _gigyaData:String='';
        
        private static var _fnCallWhenDone:Function;

        private static var _classInitialized:Boolean = false;
        private static var root;
        
        public static function init(rootVar):void {
            root=rootVar;
            _classInitialized = InitializeClass();
        }
        
        private static function InitializeClass():Boolean{
            var f:Boolean=false;
            try {
                if (root.application) {
                    if (root.application.parameters['gigyaData']!=null) {
                        _gigyaData=root.application.parameters['gigyaData'];
                    }               
                } else {
                    if (root.loaderInfo.parameters['gigyaData']!=null) {
                        _gigyaData=root.loaderInfo.parameters['gigyaData'];
                    }
                }
                f=true;
            }
            catch(e:Error) {}
            return f;
        }
        
        public static function ReportEvent(customEvent:Object):void{
            var key:String;
            _pendingEventsQueue['el'+(_head++)]=customEvent;
            ProccessEvents();
        }
        
        public static function HasPendingEvents():Boolean{
            return ((_head!=_tail) || 
                    ((_dynamicReporterMC) && (typeof (_dynamicReporterMC.HasPendingEvents) == 'function') && _dynamicReporterMC.HasPendingEvents())
                    );
        }
        
        public static function CallOnceWhenAllEventsAreSent(fnOnDone:Function):void{
            if (typeof(fnOnDone)=='function') {
                _fnCallWhenDone=fnOnDone;
                WaitUntilAllDone();
            }
        }
        
        //===================================================
        private static function LoadDynamicReporterMC():void {
            Security.allowDomain("cdn.gigya.com");
            Security.allowInsecureDomain("cdn.gigya.com");
            if (_dynamicReporterMC==null) {
                _dynamicReporterMC=new MovieClip();
            }
            
            var myTimer:Timer = new Timer(3000);
            myTimer.addEventListener("timer", CallProccessEvents);// to make sure we retry if load of swf failed
            myTimer.start();
            _dynamicReporterMC['WildefireReporterLoaded']=function():void{
                ProccessEvents();
            }
            var d:Date = new Date();
            var now:Number=d.getTime();
            d.getTime();
            if ((now-_lastDynamicReporterLoadAttemtTime)>3000) {
                _lastDynamicReporterLoadAttemtTime=now;
                var l:Loader = new Loader();
                l.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadComplete);
                l.load(new URLRequest('http://cdn.gigya.com/wildfire/swf/WildfireDynamicReporterAS3.swf'));
            }
        }
        private static function onLoadComplete(e:Event):void {
           var loaderInfo:LoaderInfo = e.target as LoaderInfo;
           _dynamicReporterMC = e.target.content;
        }
          
        public static function ProccessEvents():void {
            if ((_dynamicReporterMC!=null) && (_dynamicReporterMC.ReportEvent != null)) {
                try { // make sure nobody killed the loaded MC
                    while (_tail<_head) {
                        var evt:Object=_pendingEventsQueue['el'+(_tail++)];
                        _dynamicReporterMC.ReportEvent(evt,_gigyaData);
                    }
                    WaitUntilAllDone();
                }
                catch(e:Error){
                }
            }
            else {
                LoadDynamicReporterMC();
            }
        }
        

        
        //to make the call to ProccessEvents be as a class member and not just a function
        private static function CallProccessEvents(e:Event):void {
            ProccessEvents();
        }

        private static function CallAndClearOnDoneHandler():void{
            var fn:Function=_fnCallWhenDone;
            _fnCallWhenDone=null;
            if (typeof(fn)=='function') { try{ fn(); } catch (e:Error){} }
        }
        
        private static function WaitUntilAllDone():void{
            if (!HasPendingEvents()) {
                CallAndClearOnDoneHandler();
            }
        }
    }
}