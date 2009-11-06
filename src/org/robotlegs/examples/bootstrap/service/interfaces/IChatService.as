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
	import org.robotlegs.examples.bootstrap.model.vo.ChatMessage;

	public interface IChatService
	{
		/**
		 * Send a message to the service. 
		 * @param message
		 * 
		 */		
		function sendMessage(message:ChatMessage):void;
		/**
		 * Set the username of the current user. 
		 * @param username
		 * 
		 */		
		function setUserName(username:String):void;
		/**
		 * Connect to the server 
		 * @param server
		 * @param port
		 * 
		 */		
		function connect(server:String, port:int):void;
		/**
		 * Disconnect from the server. 
		 * 
		 */		
		function disconnect():void;
	}
}