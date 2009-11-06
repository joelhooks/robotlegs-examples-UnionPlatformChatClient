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
package org.robotlegs.examples.bootstrap.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.examples.bootstrap.model.enums.LoginState;
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;
	import org.robotlegs.examples.bootstrap.service.interfaces.IUserService;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Provides API for interacting with remote UserService for the purpose of
	 * retrieving, creating, and manipulating UserVO objects stored in a 
	 * database.
	 *  
	 * @author joel
	 * 
	 */
	public class UserService extends Actor implements IUserService
	{
		/**
		 * The name of the remote service destination. 
		 */		
		public static const REMOTE_DESTINATION:String = "UserService";
		
		/**
		 * The RemoteObject will be injected in by Robotlegs. This is 
		 * configured in ConfigureServicesCommand.
		 */		
		[Inject(name="UserService")]
		public var service:RemoteObject;
		
		protected var responder:Responder;
		
		public function UserService()
		{
		}
		
		/**
		 * Logs the user in to the remote service.
		 * 
		 */
		public function login(user:UserVO):void
		{
			var responder:Responder = new Responder(handleLoginResult, handleLoginFault)
			var token:AsyncToken = service.login(user.username,user.password);
			token.addResponder( responder );
		}
		
		public function logout():void
		{
			
		}
		
		public function registerUser(user:UserVO):void
		{
			var responder:Responder = new Responder(handleLoginResult, handleLoginFault)
			var token:AsyncToken = service.register(user.username,user.password);
			token.addResponder( responder );			
		}
		

		// ============================
		// Event Handlers
		// ============================
				
		protected function handleLoginResult(event:ResultEvent):void
		{
			var user:UserVO = event.result as UserVO;
			eventDispatcher.dispatchEvent( new LoginEvent(LoginEvent.LOGIN_SUCCESS, LoginState.LOGIN_SUCCESS, user) )
		}
		
		protected function handleLogoutResult(event:ResultEvent):void
		{
			trace(event.result);
		}
				
		protected function handleLoginFault(event:FaultEvent):void
		{
			eventDispatcher.dispatchEvent( new LoginEvent(LoginEvent.LOGIN_ERROR, event.fault.faultString) )
		}
		
		protected function handleFault(event:FaultEvent):void
		{
			trace("[SERVICE FAULT]", REMOTE_DESTINATION, event.fault.faultDetail);
		}
	}
}