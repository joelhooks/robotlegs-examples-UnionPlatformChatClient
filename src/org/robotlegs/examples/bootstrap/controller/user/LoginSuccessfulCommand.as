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
package org.robotlegs.examples.bootstrap.controller.user
{
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.examples.bootstrap.model.CurrentUserModel;
	import org.robotlegs.examples.bootstrap.service.interfaces.IChatService;
	import org.robotlegs.mvcs.Command;

	public class LoginSuccessfulCommand extends Command
	{
		[Inject]
		public var event:LoginEvent;
		
		[Inject]
		public var userModel:CurrentUserModel;
		
		[Inject]
		public var chatService:IChatService;
		
		override public function execute():void
		{
			userModel.user = event.user;
			chatService.connect("tryunion.com", 9100);
		}
	}
}