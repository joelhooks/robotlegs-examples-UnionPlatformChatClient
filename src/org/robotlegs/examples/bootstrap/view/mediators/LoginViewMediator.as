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
	import flash.events.Event;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.examples.bootstrap.view.components.LoginView;
	import org.robotlegs.mvcs.Mediator;
	
	public class LoginViewMediator extends Mediator implements IMediator
	{
		[Inject]
		public var view:LoginView;
		
		public function LoginViewMediator()
		{
		}
		
		override public function onRegister() : void
		{
			eventMap.mapListener( view, LoginEvent.LOGIN, eventDispatcher.dispatchEvent ); 
			eventMap.mapListener( view, LoginEvent.REGISTER, eventDispatcher.dispatchEvent ); 
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_ERROR, handleLoginResult );
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_SUCCESS, handleLoginResult );
		}
		
		protected function handleLoginResult(event:LoginEvent):void
		{
			view.clearInputs();
			view.active = false;
		}
	}
}