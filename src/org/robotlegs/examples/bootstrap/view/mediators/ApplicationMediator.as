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
	import org.robotlegs.mvcs.Mediator;

	public class ApplicationMediator extends Mediator implements IMediator
	{
		[Inject]
		public var app:RobotlegsUnionChat;
		
		public function ApplicationMediator()
		{
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGIN_SUCCESS, handleLoginSuccess );
			eventMap.mapListener( eventDispatcher, LoginEvent.LOGOUT, handleLogout );
		}
		
		protected function handleLoginSuccess(event:LoginEvent):void
		{
			app.vs.selectedIndex = 1;
		}
		
		public function handleLogout(event:LoginEvent):void
		{
			app.vs.selectedIndex = 0;
		}

	}
}