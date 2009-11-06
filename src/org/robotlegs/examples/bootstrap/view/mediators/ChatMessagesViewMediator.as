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