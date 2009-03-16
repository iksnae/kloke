package com.iksnae.xmedia.view
{
	import flash.display.Sprite;
	import flash.net.LocalConnection;
	import flash.system.Security;

	public class YouTubPlayer extends Sprite
	{
		
		public static const PLAYER_API_URL:String = "http://www.youtube.com/v/";
		public static const PLAYER_CHROMELESS_URL:String = "http://www.youtube.com/apiplayer";
		public static const PLAYER_WRAPPER_URL:String = "as2_tubeloc.swf";
		
		
		private var receivingLocalConnection:LocalConnection;
		private var sendingLocalConnection:LocalConnection;
		private var as3Id:String;
        private var as2Id:String;
		
		private var idIncrementer:Number = 0;
		private var playerWrapperUrl:String = PLAYER_WRAPPER_URL;
		private var readyForLoad:Boolean = true;
		private static const LOCAL_CONNECTION_EVENT:String = "onLocalConnectionEvent";
        private static const ON_YT_MOVIE_COMPLETE:String = "onYouTubeMovieComplete";
        private var apiUrl:String;
        private var concatenatedUrl:String;
        private var waitingForLoad:Boolean = false;
        
		
		public function YouTubPlayer()
		{
			super();
			Security.allowDomain("www.youtube.com"); 
            Security.allowDomain("gdata.youtube.com"); 
            Security.allowInsecureDomain("gdata.youtube.com"); 
            Security.allowInsecureDomain("www.youtube.com");
            
            
            init()
		}
		private function init():void {
                //only do if wrapper Url has been set
                if(playerWrapperUrl) {
                        //new uid for as3
                        as3Id = "as3Id_" + new Date().time.toString() + (idIncrementer++).toString();

                        //new uid for as2
                        as2Id = "as2Id_" + new Date().time.toString() + (idIncrementer++).toString();
                                                        
                        //append params
                        concatenatedUrl = playerWrapperUrl + "?as3Id=" + as3Id + "&as2Id=" + as2Id + "&as3Listener=" + LOCAL_CONNECTION_EVENT + "&playerAPIUrl=" + escape(apiUrl);
                        if(!readyForLoad) {
                                waitingForLoad = true;
                                //destroy old instance
                               // destroy();
                        } else {
                                //init loader
                             //   initLoader();
                        }
                } else {
                        throw new Error("You need to set playerWrapperUrl before init'n the player");
                }
        }
		
	}
}