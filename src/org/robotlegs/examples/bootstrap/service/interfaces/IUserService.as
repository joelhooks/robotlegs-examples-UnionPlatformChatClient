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
package org.robotlegs.examples.bootstrap.service.interfaces
{
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;

	public interface IUserService
	{
		/**
		 * Log a user into the service. 
		 * @param user the user to login
		 * 
		 */		
		function login(user:UserVO):void;
		/**
		 * Register a new user with the service. 
		 * @param user the user to register
		 * 
		 */		
		function registerUser(user:UserVO):void;
		/**
		 * Log the user out of the service. 
		 * 
		 */		
		function logout():void;
	}
}