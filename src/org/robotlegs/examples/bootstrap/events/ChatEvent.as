/*
* Robotlegs Chat Client Example using WebORB (authentication) and the Union Platform
* for client communicaton.
* 	
* Copyright (c) 2009 the original author or authors
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*	
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*	
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
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