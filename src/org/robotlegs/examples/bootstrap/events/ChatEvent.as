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
	
	import org.robotlegs.examples.bootstrap.model.vo.ChatMessage;
	
	public class ChatEvent extends Event
	{
		public static const CHAT_CONNECTED:String = "chatConnected";
		public static const CHAT_READY:String = "chatReady";
		public static const SEND_MESSAGE:String = "sendMessage";
		public static const MESSAGE_RECEIVED:String = "messageRecevied";
		public static const MESSAGE_ADDED:String	= "messageAdded";
		
		public var message:ChatMessage;
		
		public function ChatEvent(type:String, message:ChatMessage=null)
		{
			this.message = message;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new ChatEvent(type, message);
		}
	}
}