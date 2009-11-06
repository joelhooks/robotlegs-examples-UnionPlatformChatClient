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
	
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.FSMInjector;
	import org.robotlegs.utilities.statemachine.StateEvent;
	import org.robotlegs.utilities.statemachine.StateMachine;
	
	/**
	 * Configure the Finite State Machine for bootstrapping the application
	 * 
	 * @author joel
	 * 
	 */
	public class BootstrapApplicationCommand extends Command
	{
		override public function execute():void
		{
			var fsmInjector:FSMInjector = new FSMInjector( AppConfigStateConstants.FSM );
			var stateMachine:StateMachine = new StateMachine(eventDispatcher);
			
			//map the commands for the state machine.
			//all states in the machine are mapped to a specific command
			//that is triggered in order 
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_SERVICES, ConfigureServicesCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_VIEWS, ConfigureViewsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_MODELS,ConfigureModelsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.CONFIGURE_COMMANDS, ConfigureCommandsCommand, StateEvent, true );
			commandMap.mapEvent( AppConfigStateConstants.FAIL,ConfigurationFailedCommand, StateEvent, true );
			
			//injecting the state machine into the FSMInjector
			fsmInjector.inject(stateMachine);
			
			//start the state machine
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.STARTED));
		}
	}
}