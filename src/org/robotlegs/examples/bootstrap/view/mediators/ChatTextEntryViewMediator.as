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
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.view.components.ChatTextEntryView;
	import org.robotlegs.mvcs.Mediator;
	
	public class ChatTextEntryViewMediator extends Mediator
	{
		[Inject]
		public var view:ChatTextEntryView;
		
		public function ChatTextEntryViewMediator()
		{
		}
		
		override public function onRegister() : void
		{
			eventMap.mapListener( view, ChatEvent.SEND_MESSAGE, eventDispatcher.dispatchEvent );
		}
	}
}