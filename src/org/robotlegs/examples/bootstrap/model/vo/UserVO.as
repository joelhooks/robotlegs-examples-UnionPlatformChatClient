/*
* Robotlegs Chat Client Example using WebORB (authentication) and the Union Platform
* for client communicaton.
* 	
* Copyright (c) 2009 the original author or authors
*
* http://creativecommons.org/licenses/by-sa/3.0/
*	
* original author:
* Joel Hooks
* http://joelhooks.com
* joelhooks@gmail.com 
*/
package org.robotlegs.examples.bootstrap.model.vo
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	[RemoteClass(alias="org.robotlegs.examples.bootstrap.model.vo.UserVO")]
	[Bindable]
	public class UserVO extends EventDispatcher
	{

		public var id:int;
		public var email:String;
		public var password:String;
		public var name:String;
		public var username:String;
		public var chat_id:String;
		
		public function UserVO()
		{
		}
		
		override public function toString() : String
		{
			return username;
		}
	}
}