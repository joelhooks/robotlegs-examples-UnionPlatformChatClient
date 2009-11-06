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
package org.robotlegs.examples.bootstrap.controller.chat
{
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.model.ChatMessageListModel;
	import org.robotlegs.mvcs.Command;
	
	public class ChatMessageReceived extends Command
	{
		[Inject]
		public var event:ChatEvent;
		
		[Inject]
		public var chatModel:ChatMessageListModel;
		
		override public function execute() : void
		{
			chatModel.addMessage(event.message);
		}
	}
}