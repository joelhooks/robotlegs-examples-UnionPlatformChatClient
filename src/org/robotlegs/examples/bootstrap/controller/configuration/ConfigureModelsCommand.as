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
	import org.robotlegs.examples.bootstrap.model.ChatMessageListModel;
	import org.robotlegs.examples.bootstrap.model.ChatRoomMemberListModel;
	import org.robotlegs.examples.bootstrap.model.CurrentUserModel;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;
	
	/**
	 * Configure the application data model
	 * @author joel
	 * 
	 */
	public class ConfigureModelsCommand extends Command
	{
		override public function execute():void
		{
			//map Model classes for injection
			injector.mapSingleton( CurrentUserModel );
			injector.mapSingleton( ChatMessageListModel );
			injector.mapSingleton( ChatRoomMemberListModel );
			
			//let the state machine know this step is complete
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_MODELS_COMPLETE));
		}
	}
}