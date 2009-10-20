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
package org.robotlegs.examples.bootstrap.controller.configuration
{
	import org.robotlegs.core.ICommand;
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

	public class ConfigureCommandsCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			commandMap.mapEvent( LoginSuccessfulCommand, LoginEvent.LOGIN_SUCCESS, LoginEvent );
			commandMap.mapEvent( LoginCommand, LoginEvent.LOGIN, LoginEvent );
			commandMap.mapEvent( RegisterUserCommand, LoginEvent.REGISTER, LoginEvent );
			commandMap.mapEvent( LogoutCommand, LoginEvent.LOGOUT, LoginEvent );
			
			commandMap.mapEvent( SetChatUsernameCommand, ChatEvent.CHAT_CONNECTED, ChatEvent, true );
			commandMap.mapEvent( ChatMessageReceived, ChatEvent.MESSAGE_RECEIVED, ChatEvent );
			commandMap.mapEvent( SendChatMessageCommand, ChatEvent.SEND_MESSAGE, ChatEvent );
			commandMap.mapEvent( UpdateChatRoomMembersCommand, ChatRoomMembersEvent.MEMBERS_UPDATE_RECEIVED, ChatRoomMembersEvent );
			
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_COMMANDS_COMPLETE));
		}
	}
}