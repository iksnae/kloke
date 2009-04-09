package com.kloke.model.services
{
    import com.gigya.AS3.WFReports;
    
    import flash.display.Loader;
    import flash.display.MovieClip;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.net.URLRequest;
    import flash.system.Security;
    import flash.text.TextField;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    public class GigyaService
    {
        
        
        public var pid:String;
        public var moduleID:String = 'PostModule1';
        public var gigyaMC:MovieClip;
        
        private var _preloaderView:Sprite;
        public var _config:Object;
        
        
        
        /**
         * the dimensions of the widget swf. sets values in embed code 
         */     
        public var widgetWidth:Number;
        public var widgetHeight:Number;
        
        public var embedderWidth:Number;
        public var embedderHeight:Number;
        
        public var widgetDescription:String;
        
        public var widgetLocation:String;
        public var flashVars:String;
        public var widgetID:String;
        public var widgetTitle:String;
        public var icon:String; 
        public var preview:String;
        public var cid:String;
        
        public var advancedTracking:Boolean    = true;
        public var showEmail:Boolean           = true;
        public var showBookmark:Boolean        = true;
        
        
        
        
        
        
        public function GigyaService()
        {
            
            // add gigya domains....            
            Security.allowDomain("cdn.gigya.com")
            Security.allowInsecureDomain("cdn.gigya.com")
            
            
            
        }
        
        
        public function createGigyaMC(configOptions:Object=null):MovieClip{
            
            // create gigya view
            gigyaMC = new MovieClip();
            
            // draw preloader
            drawPreloaderView()
            
            
            // declare the config object
            _config = new Object()
            
            
            
            // check for config options...
            if(configOptions != null){
                
                // store each optional value...
                for (var i in configOptions){
                    trace("Property: "+i+"   Value:"+configOptions[i])  
                    _config[i]              = configOptions[i];
                }
                // store required gigya settings...
                _config['width']            = embedderWidth;
                _config['height']           = embedderHeight;
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
            var url:String = 'http://cdn.gigya.com/Wildfire/swf/WildfireInAS3.swf?ModuleID='+moduleID;
            
            
            // create url request object
            var req:URLRequest = new URLRequest(url);  
            
            
            // store the config in the gigyaMovieClip
            gigyaMC[moduleID] = _config;
            
            
            // add the loader to the gigyaMC display
            gigyaMC.addChild(loader);
            
            
            // start the load
            loader.load(req)
            
            // add tracking
            if(advancedTracking){
                 WFReports.init(gigyaMC);
                 WFReports.ReportEvent({evt: 'Gigiya Loaded!', pid: pid,cid: cid })
            }
            return gigyaMC;
        }
        /**
         * create simple preloader view 
         * 
         */     
        private function drawPreloaderView():void{
            _preloaderView = new Sprite()
            _preloaderView.visible = true
            var txt:TextField = new TextField()
            txt.defaultTextFormat = new TextFormat('Arial',12,0xffffff,true,null,null,null,null,TextFormatAlign.CENTER)
            txt.width = embedderWidth;
            txt.selectable =txt.mouseEnabled=false
            _preloaderView.graphics.beginFill(0x000000,.6)
            _preloaderView.graphics.drawRoundRect(0,0,embedderWidth,embedderHeight,10)
            _preloaderView.addChild(txt)
            gigyaMC.addChild(_preloaderView)
            
        }
        /**
         * remove the preloader view so it may be collected by the GC
         * 
         */     
        private function killPreloaderView():void{
            _preloaderView.visible = false
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
            if(flashVars==null)return '<object width="'+widgetWidth+'" height="'+widgetHeight+'"><param name="movie" value="'+widgetLocation+'"></param><param name="wmode" value="transparent"></param><embed src="'+widgetLocation+'" type="application/x-shockwave-flash" wmode="transparent" width="'+widgetWidth+'" height="'+widgetHeight+'"></embed></object>'
            else return '<object width="'+widgetWidth+'" height="'+widgetHeight+'"><param name="movie" value="'+widgetLocation+'"></param><param name="wmode" value="transparent"></param><embed src="'+widgetLocation+'" type="application/x-shockwave-flash" wmode="transparent" width="'+widgetWidth+'" height="'+widgetHeight+'" FlashVars="'+flashVars+'"></embed></object>'
        }
    }
}