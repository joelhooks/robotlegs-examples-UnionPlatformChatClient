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
			commandMap.mapEvent( BootstrapApplicationCommand, ContextEvent.STARTUP, ContextEvent, true );
						
			//Start the Application
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
		}
	}
}