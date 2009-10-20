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
	import org.robotlegs.examples.bootstrap.AppConfigStateConstants;
	
	import org.robotlegs.core.ICommand;
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
	public class BootstrapApplicationCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			var fsmInjector:FSMInjector = new FSMInjector( AppConfigStateConstants.FSM );
			var stateMachine:StateMachine = new StateMachine(eventDispatcher);
			
			//map the commands for the state machine.
			//all states in the machine are mapped to a specific command
			//that is triggered in order 
			commandMap.mapEvent( ConfigureServicesCommand, AppConfigStateConstants.CONFIGURE_SERVICES, StateEvent, true );
			commandMap.mapEvent( ConfigureViewsCommand, AppConfigStateConstants.CONFIGURE_VIEWS, StateEvent, true );
			commandMap.mapEvent( ConfigureModelsCommand, AppConfigStateConstants.CONFIGURE_MODELS, StateEvent, true );
			commandMap.mapEvent( ConfigureCommandsCommand, AppConfigStateConstants.CONFIGURE_COMMANDS, StateEvent, true );
			commandMap.mapEvent( ConfigurationFailedCommand, AppConfigStateConstants.FAIL, StateEvent, true );
			
			//injecting the state machine into the FSMInjector
			fsmInjector.inject(stateMachine);
			
			//start the state machine
			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.STARTED));
		}
	}
}