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
package org.robotlegs.examples.bootstrap.events
{
	import flash.events.Event;
	
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;

	public class LoginEvent extends Event
	{
		public static const LOGIN:String = "login";
		public static const LOGIN_PROCESSING:String = "loginProcessing";
		public static const LOGIN_ERROR:String = "loginError";
		public static const LOGIN_SUCCESS:String = "loginSuccess";
		public static const LOGOUT:String = "logout";
		public static const LOGGED_OUT:String = "loggedOut";
		public static const REGISTER:String = "register";
		public static const CURRENT_USER_UPDATED:String = "currentUserUpdated";
		
		public var user:UserVO;
		public var message:String;
		
		public function LoginEvent(type:String, message:String = null, user:UserVO = null)
		{
			this.message = message;
			this.user = user;
			
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new LoginEvent(type, message, user);
		}
	}
}