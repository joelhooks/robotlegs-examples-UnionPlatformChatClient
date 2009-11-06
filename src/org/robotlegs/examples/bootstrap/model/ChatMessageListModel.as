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
package org.robotlegs.examples.bootstrap.model
{
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.model.vo.ChatMessage;
	import org.robotlegs.mvcs.Actor;
	
	public class ChatMessageListModel extends Actor
	{
		private var _messages:ArrayCollection;
		
		public function ChatMessageListModel()
		{
			_messages = new ArrayCollection();
		}

		public function get messages():ArrayCollection
		{
			return _messages;
		}
		
		public function addMessage(message:ChatMessage):void
		{
			if(!messages.contains(message))
			{
				messages.addItem(message);
				eventDispatcher.dispatchEvent( new ChatEvent(ChatEvent.MESSAGE_ADDED, message));
			}
				
		}

	}
}