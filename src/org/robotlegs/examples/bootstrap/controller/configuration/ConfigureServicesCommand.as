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
	import mx.rpc.remoting.RemoteObject;
	
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
	public class ConfigureServicesCommand extends Command
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