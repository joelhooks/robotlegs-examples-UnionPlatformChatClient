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
	import mx.collections.ArrayCollection;
	
	import org.robotlegs.examples.bootstrap.events.ChatRoomMembersEvent;
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;
	import org.robotlegs.mvcs.Actor;
	
	/**
	 * Store the users currently in the chatroom.
	 * 
	 * @author joel
	 * 
	 */	
	public class ChatRoomMemberListModel extends Actor
	{
		public var members:ArrayCollection;
		public var membersStringList:String = "";
		
		public function ChatRoomMemberListModel()
		{
			members = new ArrayCollection();
		}
		
		/**
		 * Update the current list with a new array of chat room members. 
		 * @param membersCollection a list of new members
		 * 
		 */		
		public function updateFromCollection(membersCollection:ArrayCollection):void
		{
			var user:UserVO;
			members.removeAll();
			membersStringList = "";
			for each(user in membersCollection)
			{
				members.addItem(user);
				membersStringList += user.username + "\n";
			}
			
			//notify interested actors that the member list has been updated
			eventDispatcher.dispatchEvent( new ChatRoomMembersEvent(ChatRoomMembersEvent.MEMBERS_UPDATED, members) );
		}
	}
}