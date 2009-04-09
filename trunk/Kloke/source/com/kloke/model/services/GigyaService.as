package com.kloke.model.services
{
    import com.gigya.AS3.WFReports;
    
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.system.Security;

    public class GigyaService
    {
        
        
        private var _pid:String;
        private var _moduleID:String = 'PostModule1';
        private var _config:Object;
        
        private var _preloaderView:Sprite;
        private var gigyaMC:MovieClip;
        
        /**
         * the dimensions of the widget swf. sets values in embed code 
         */     
        public var widgetWidth:Number   = 300;
        public var widgetHeight:Number  = 300;
        
        public var embedderWidth:Number = 300;
        public var embedderHeight:Number= 300;
        public var widgetDescription:String   = 'NauticaTOC'
        
        public var widgetLocation:String= 'http://irisny.com/view/nautica/nauticaTidesWidget.swf';
        public var flashVars:String;
        public var widgetID:String;
        public var widgetTitle:String;
        public var icon:String            = 'http://irisny.com/view/nautica/images/icon.gif'; 
        public var preview:String         = 'http://irisny.com/view/nautica/images/icon.gif';
        public var cid:String             = ''
        
        public var advancedTracking:Boolean    = true;
        public var showEmail:Boolean           = true;
        public var showBookmark:Boolean        = true;
        
        
        
        
        
        
        public function GigyaService()
        {
            
            // add gigya domains....            
            Security.allowDomain("cdn.gigya.com")
            Security.allowInsecureDomain("cdn.gigya.com")
            
            
            
        }
        
        
        public function getGigyaMC(pid:String, configOptions:Object=null, flashVars:String=null):MovieClip{
            
            
            // draw preloader
            drawPreloaderView()
            
            
            // create gigya view
            gigyaMC = new MovieClip();
            
            
            // declare the config object
            _config = new Object()
            
            
            // store the publish id
            _pid = pid;
            
            
            // store the flashvars
            flashVars = flashVars;
            
            // check for config options...
            if(configOptions != null){
                
                // store each optional value...
                for (var i in configOptions){
                    trace("Property: "+i+"   Value:"+configOptions[i])  
                    _config[i]              = configOptions[i];
                }
                // store required gigya settings...
                _config['partner']          = pid;
                _config['widgetTitle']      = widgetTitle;
                _config['advancedTracking'] = advancedTracking;
                _config['UIConfig']         = '<config><display showEmail="'+showEmail+'" showBookmark="'+showBookmark+'" /></body></config>'
                _config['defaultPreviewURL']= preview;
                _config['widgetDescription']= widgetDescription;
                _config['iconURL']          = icon;
                _config['defaultContent']   = embedCode();
            }
            
            
            // create loader to load emedder view
            var loader:Loader = new Loader()
            
            
            // create url to emedder swf with module id
            var url:String = 'http://cdn.gigya.com/Wildfire/swf/WildfireInAS3.swf?ModuleID='+_moduleID;
            
            
            // create url request object
            var req:URLRequest = new URLRequest(url);  
            
            
            // store the config in the gigyaMovieClip
            gigyaMC[_moduleID] = _config;
            
            
            // add the loader to the gigyaMC display
            gigyaMC.addChild(loader);
            
            
            // start the load
            loader.load(req)
            
            // add tracking
            if(advancedTracking){
                 WFReports.init(gigyaMC);
                 WFReports.ReportEvent({evt: 'Gigiya Loaded!', pid: _pid,cid: cid })
            }
            return gigyaMC;
        }
        /**
         * create simple preloader view 
         * 
         */     
        private function drawPreloaderView():void{
            _preloaderView = new Sprite()
            _preloaderView.graphics.beginFill(0x000000,.6)
            _preloaderView.graphics.drawRoundRect(0,0,300,280,5)
            gigyaMC.addChild(_preloaderView)
            
        }
        /**
         * remove the preloader view so it may be collected by the GC
         * 
         */     
        private function killPreloaderView():void{
             gigyaMC.removeChild(_preloaderView)
             
        }
        /**
         * init...  
         * @param result
         * 
         */     
        private function onGigyaInit(result:Object):void{
        
        }
        private function onGigiaLoadComplete(e:Event):void{
              
        }
        private function embedCode():String{
            return '<object width="'+widgetWidth+'" height="'+widgetHeight+'"><param name="movie" value="'+widgetLocation+'"></param><param name="wmode" value="transparent"></param><embed src="'+widgetLocation+'" type="application/x-shockwave-flash" wmode="transparent" width="'+widgetWidth+'" height="'+widgetHeight+'"></embed></object>'
        }
    }
}