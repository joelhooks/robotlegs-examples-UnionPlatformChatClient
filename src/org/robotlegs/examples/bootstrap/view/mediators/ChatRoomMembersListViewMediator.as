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
package org.robotlegs.examples.bootstrap.view.mediators
{
	import org.robotlegs.examples.bootstrap.events.ChatRoomMembersEvent;
	import org.robotlegs.examples.bootstrap.model.ChatRoomMemberListModel;
	import org.robotlegs.examples.bootstrap.view.components.ChatRoomMemberListView;
	import org.robotlegs.mvcs.Mediator;
	
	public class ChatRoomMembersListViewMediator extends Mediator
	{
		[Inject]
		public var view:ChatRoomMemberListView;
		
		[Inject]
		public var membersListModel:ChatRoomMemberListModel;
		
		public function ChatRoomMembersListViewMediator()
		{
		}
		
		override public function onRegister() : void
		{
			eventMap.mapListener( eventDispatcher, ChatRoomMembersEvent.MEMBERS_UPDATED, handleMembersUpdated );
		}
		
		protected function handleMembersUpdated(event:ChatRoomMembersEvent):void
		{
			view.members = membersListModel.membersStringList;
		}
	}
}