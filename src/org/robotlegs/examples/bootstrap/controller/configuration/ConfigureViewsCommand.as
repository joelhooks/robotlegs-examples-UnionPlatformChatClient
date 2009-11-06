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
	public class ConfigureViewsCommand extends Command
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