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
package org.robotlegs.examples.bootstrap.events
{
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class ChatRoomMembersEvent extends Event
	{
		public static const MEMBERS_UPDATE_RECEIVED:String = "membersUpdateRecieved";
		public static const MEMBERS_UPDATED:String = "membersUpdated";
		
		public var members:ArrayCollection;
		
		public function ChatRoomMembersEvent(type:String, members:ArrayCollection=null)
		{
			this.members = members;
			super(type, false, false);
		}
		
		override public function clone() : Event
		{
			return new ChatRoomMembersEvent(type, members);
		}
	}
}