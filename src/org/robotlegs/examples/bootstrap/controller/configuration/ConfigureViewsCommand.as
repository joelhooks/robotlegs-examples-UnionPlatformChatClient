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
	import org.robotlegs.examples.bootstrap.view.components.ApplicationHeader;
	import org.robotlegs.examples.bootstrap.view.components.ChatMessagesView;
	import org.robotlegs.examples.bootstrap.view.components.ChatRoomMemberListView;
	import org.robotlegs.examples.bootstrap.view.components.ChatTextEntryView;
	import org.robotlegs.examples.bootstrap.view.components.LoginView;
	import org.robotlegs.examples.bootstrap.view.mediators.ApplicationHeaderMediator;
	import org.robotlegs.examples.bootstrap.view.mediators.ApplicationMediator;
	import org.robotlegs.examples.bootstrap.view.mediators.ChatMessagesViewMediator;
	import org.robotlegs.examples.bootstrap.view.mediators.ChatRoomMembersListViewMediator;
	import org.robotlegs.examples.bootstrap.view.mediators.ChatTextEntryViewMediator;
	import org.robotlegs.examples.bootstrap.view.mediators.LoginViewMediator;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * Configure the application views by mapping view components to their
	 * respective mediators.
	 * 
	 * @author joel
	 * 
	 */
	public class ConfigureViewsCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			//mediate the root application:
			//robotlegs automaticcally creates this mediator since the
			//root application is the contextView and has already been 
			//addded to the stage.
			mediatorMap.mapView( RobotlegsUnionChat, ApplicationMediator);

			//map the mediators for the remaning view.
			//the mediators will be created as the views are added to the stage.
			mediatorMap.mapView( ApplicationHeader, ApplicationHeaderMediator );
			mediatorMap.mapView( LoginView, LoginViewMediator );
			mediatorMap.mapView( ChatMessagesView, ChatMessagesViewMediator );
			mediatorMap.mapView( ChatTextEntryView, ChatTextEntryViewMediator );
			mediatorMap.mapView( ChatRoomMemberListView, ChatRoomMembersListViewMediator );
			
			//notifiy the state machine that we are done with this step
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_VIEWS_COMPLETE));
		}
	}
}