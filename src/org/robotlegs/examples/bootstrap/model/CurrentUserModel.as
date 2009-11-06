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
package org.robotlegs.examples.bootstrap.model
{
	import org.robotlegs.examples.bootstrap.events.LoginEvent;
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;
	import org.robotlegs.mvcs.Actor;

	[Event(name="currentUserUpdated", type="org.robotlegs.examples.bootstrap.events.UserEvent")]
	
	public class CurrentUserModel extends Actor
	{
		private var _user:UserVO;
		
		public function CurrentUserModel()
		{
			super();
		}

		public function get user():UserVO
		{
			return _user;
		}

		public function set user(v:UserVO):void
		{
			_user = v;
			if(!v)
				return;
			trace("current user updated:", v.username);
			//the UserVO has been updated so let's tell anybody
			//that might be interested.
			eventDispatcher.dispatchEvent( new LoginEvent(LoginEvent.CURRENT_USER_UPDATED, null, user) );
		}

	}
}