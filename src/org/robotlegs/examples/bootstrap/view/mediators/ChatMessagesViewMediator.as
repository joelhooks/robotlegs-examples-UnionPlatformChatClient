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
package org.robotlegs.examples.bootstrap.view.mediators
{
	import mx.formatters.DateFormatter;
	
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.model.ChatMessageListModel;
	import org.robotlegs.examples.bootstrap.view.components.ChatMessagesView;
	import org.robotlegs.mvcs.Mediator;
	
	public class ChatMessagesViewMediator extends Mediator
	{
		[Inject]
		public var view:ChatMessagesView;
		
		[Inject]
		public var chatModel:ChatMessageListModel;
		
		public function ChatMessagesViewMediator()
		{
		}
		
		override public function onRegister() : void
		{
			view.messages += "Connected to Robotlegs Chat\n<a href='http://tryunion.com' target='_blank'>Powered by Union Platform</a>\n";
			
			eventMap.mapListener( eventDispatcher, ChatEvent.MESSAGE_ADDED, handleMessageAdded );
		}
		
		protected function handleMessageAdded(event:ChatEvent):void
		{
			var now:Date = new Date();
			var formatter:DateFormatter = new DateFormatter();
			formatter.formatString = "L:NNA ";
			
			view.messages += formatter.format(now) + event.message + "\n";
			view.scrollToEnd();
		}
	}
}