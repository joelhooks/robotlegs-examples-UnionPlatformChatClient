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
package org.robotlegs.examples.bootstrap
{
	import org.robotlegs.examples.bootstrap.controller.configuration.BootstrapApplicationCommand;
	import org.robotlegs.examples.bootstrap.view.mediators.ApplicationMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.core.IContext;
	import org.robotlegs.mvcs.Context;
	
	/**
	 * The context is merely mapping a single command in this example.
	 * All of the additional work to bootstrap the application will be 
	 * done in a series of commands located in the org.robotlegs.examples.bootstrap.controller.configuration
	 * package.
	 * 
	 * @author joel
	 * 
	 */
	public class UnionChatContext extends Context implements IContext
	{
		public function UnionChatContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			//Map Configuration Commands
			commandMap.mapEvent( ContextEvent.STARTUP, BootstrapApplicationCommand, ContextEvent, true );
						
			//Start the Application
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}