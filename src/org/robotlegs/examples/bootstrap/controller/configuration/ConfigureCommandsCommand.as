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
package org.robotlegs.examples.bootstrap.controller.configuration
{
	import org.robotlegs.examples.bootstrap.AppConfigStateConstants;
	import org.robotlegs.examples.bootstrap.controller.chat.ChatMessageReceived;
	import org.robotlegs.examples.bootstrap.controller.chat.SendChatMessageCommand;
	import org.robotlegs.examples.bootstrap.controller.chat.SetChatUsernameCommand;
	import org.robotlegs.examples.bootstrap.controller.chat.UpdateChatRoomMembersCommand;
	import org.robotlegs.examples.bootstrap.controller.user.LoginCommand;
	import org.robotlegs.examples.bootstrap.controller.user.LoginSuccessfulCommand;
	import org.robotlegs.examples.bootstrap.controller.user.LogoutCommand;
	import org.robotlegs.examples.bootstrap.controller.user.RegisterUserCommand;
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.events.ChatRoomMembersEvent;
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	public class ConfigureCommandsCommand extends Command
	{
		override public function execute():void
		{
			commandMap.mapEvent( LoginEvent.LOGIN_SUCCESS, LoginSuccessfulCommand, LoginEvent );
			commandMap.mapEvent( LoginEvent.LOGIN, LoginCommand, LoginEvent );
			commandMap.mapEvent( LoginEvent.REGISTER, RegisterUserCommand, LoginEvent );
			commandMap.mapEvent( LoginEvent.LOGOUT, LogoutCommand, LoginEvent );
			
			commandMap.mapEvent( ChatEvent.CHAT_CONNECTED, SetChatUsernameCommand, ChatEvent, true );
			commandMap.mapEvent( ChatEvent.MESSAGE_RECEIVED, ChatMessageReceived, ChatEvent );
			commandMap.mapEvent( ChatEvent.SEND_MESSAGE, SendChatMessageCommand, ChatEvent );
			commandMap.mapEvent( ChatRoomMembersEvent.MEMBERS_UPDATE_RECEIVED, UpdateChatRoomMembersCommand, ChatRoomMembersEvent );
			
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_COMMANDS_COMPLETE));
		}
	}
}