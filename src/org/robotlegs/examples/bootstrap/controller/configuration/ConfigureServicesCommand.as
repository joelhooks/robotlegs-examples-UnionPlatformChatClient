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
	import mx.rpc.remoting.RemoteObject;
	
	import org.robotlegs.core.ICommand;
	import org.robotlegs.examples.bootstrap.AppConfigStateConstants;
	import org.robotlegs.examples.bootstrap.service.UnionChatService;
	import org.robotlegs.examples.bootstrap.service.UserService;
	import org.robotlegs.examples.bootstrap.service.factories.RemoteObjectFactory;
	import org.robotlegs.examples.bootstrap.service.interfaces.IChatService;
	import org.robotlegs.examples.bootstrap.service.interfaces.IUserService;
	import org.robotlegs.mvcs.Command;
	import org.robotlegs.utilities.statemachine.StateEvent;

	/**
	 * Command used to configure the mappings and injection objects for 
	 * Service classes. The RemoteObjectFactory is used to provide
	 * the RemoteObjects needed by each Service to connect.
	 *  
	 * @author joel
	 * 
	 */
	public class ConfigureServicesCommand extends Command implements ICommand
	{
		override public function execute():void
		{
			//Configure the RemoteObjectFactory
			var remoteObjectFactory:RemoteObjectFactory = new RemoteObjectFactory();
			remoteObjectFactory.addChannel("my-amf", "http://joelhooks.com/weborb/weborb.php");
						
			//User Service
			injector.mapSingletonOf(IUserService, UserService);
			injector.mapValue(RemoteObject, 
								remoteObjectFactory.getRemoteObjectForService(UserService.REMOTE_DESTINATION), 
								UserService.REMOTE_DESTINATION);
			
			remoteObjectFactory.destroy();
			
			//Configure Union Chat Service
			injector.mapSingletonOf(IChatService, UnionChatService);

			eventDispatcher.dispatchEvent( new StateEvent(StateEvent.ACTION, AppConfigStateConstants.CONFIGURE_SERVICES_COMPLETE));
		}
	}
}