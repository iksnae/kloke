package com.kloke.model.types
{
	
	/**
	 * this is the video data object that will be used for storing video entry data 
	 * @author iksnae
	 * 
	 */	
	public class VideoDataObject
	{
		public const PLAYMODE_STREAMING:String = 'playmode_streaming';
		public const PLAYMODE_PROGRESSIVE:String = 'playmode_streaming';
        
		public function VideoDataObject()
		{
		}
		public var title:String;
		public var label:String;
		public var description:String;
		public var publishDate:Date;
		public var modifiedDate:Date;
		public var tags:Array;
		public var commentCount:int;
		public var commentsID:String;
		public var commentList:Array;
		public var id:String;
		public var url:String;
		public var thumb:String;
		public var playmode:String = PLAYMODE_PROGRESSIVE;
		

	}
}