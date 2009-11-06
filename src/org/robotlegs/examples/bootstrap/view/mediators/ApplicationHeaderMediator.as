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
	import org.robotlegs.core.IMediator;
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.examples.bootstrap.view.components.ApplicationHeader;
	import org.robotlegs.mvcs.Mediator;
	
	public class ApplicationHeaderMediator extends Mediator implements IMediator
	{
		[Inject]
		public var view:ApplicationHeader;
		
		public function ApplicationHeaderMediator()
		{
		}
		
		override public function onRegister() : void
		{
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_SUCCESS, handleLoginSuccess );
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_ERROR, handleLoginError );
			eventMap.mapListener( view, LoginEvent.LOGOUT, eventDispatcher.dispatchEvent );
		}
		
		protected function handleLoginSuccess(event:LoginEvent):void
		{
			view.currentLoggedInState = ApplicationHeader.LOGGED_IN;
			view.currentUser = event.user;
			view.setStatusText(event.message + event.user.username);
		}

		protected function handleLoginError(event:LoginEvent):void
		{
			view.setStatusText(event.message);
		}
	}
}