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
	import flash.events.IEventDispatcher;
	
	public class ChatMessage extends EventDispatcher
	{
		public var text:String;
		public var sender:String;
		
		public function ChatMessage()
		{
			super();
		}
		
		override public function toString() : String
		{
			return "<b>" + sender + " </b>said: " + text;
		}
	}
}