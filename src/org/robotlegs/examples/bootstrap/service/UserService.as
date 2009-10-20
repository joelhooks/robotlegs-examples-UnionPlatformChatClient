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
	import org.robotlegs.mvcs.Service;
	
	/**
	 * Provides API for interacting with remote UserService for the purpose of
	 * retrieving, creating, and manipulating UserVO objects stored in a 
	 * database.
	 *  
	 * @author joel
	 * 
	 */
	public class UserService extends Service implements IUserService
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