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
package org.robotlegs.examples.bootstrap.model.enums
{
	public class LoginState
	{
		public static const NONE:String = "";
		public static const LOGGED_OUT:String = "logged out...";
		public static const LOADING_INTERFACE:String = "loading interface";
		public static const CHECKING_CREDENTIALS:String = "checking credentials";
		public static const LOGIN_SUCCESS:String = "logged in as ";
		public static const LOGIN_ERROR:String = "error...";
		public static const SIGNING_OUT:String = "signing out...";
		public static const NOT_FOUND:String = "the email/password combination was not found";
	}
}