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
	import mx.collections.ArrayCollection;
	
	import net.user1.reactor.IClient;
	import net.user1.reactor.Reactor;
	import net.user1.reactor.ReactorEvent;
	import net.user1.reactor.Room;
	import net.user1.reactor.RoomEvent;
	
	import org.robotlegs.examples.bootstrap.events.ChatEvent;
	import org.robotlegs.examples.bootstrap.events.ChatRoomMembersEvent;
	import org.robotlegs.examples.bootstrap.model.vo.ChatMessage;
	import org.robotlegs.examples.bootstrap.model.vo.UserVO;
	import org.robotlegs.examples.bootstrap.service.interfaces.IChatService;
	import org.robotlegs.mvcs.Actor;

	public class UnionChatService extends Actor implements IChatService
	{
		protected var reactor:Reactor;
		protected var chatRoom:Room;
		
		protected var usernname:String;
		
		public function UnionChatService()
		{
			reactor = new Reactor();
			reactor.addEventListener( ReactorEvent.READY, handleReactorReady );
		}
		
		public function connect(server:String, port:int):void
		{
			reactor.connect(server, port);
		}
		
		public function disconnect():void
		{
			chatRoom.leave();
		}
		
		public function setUserName(username:String):void
		{
			var self:IClient;
			this.usernname = username;
			self = reactor.getClientManager().self();
			self.setAttribute("USERNAME", username);
			eventDispatcher.dispatchEvent(new ChatEvent(ChatEvent.CHAT_READY));
		}
		
		public function sendMessage(message:ChatMessage):void
		{
			chatRoom.sendMessage( "CHAT_MESSAGE", true, null, message.text );
		}
		
		protected function handleReactorReady(event:ReactorEvent):void
		{
			chatRoom = reactor.getRoomManager().createRoom("robotlegs");
			chatRoom.addMessageListener( "CHAT_MESSAGE", handleChatMessage );
			chatRoom.join();
			chatRoom.addEventListener( RoomEvent.JOIN_RESULT, handleJoinResult );
			chatRoom.addEventListener( RoomEvent.ADD_CLIENT, handleAddClient );
			chatRoom.addEventListener( RoomEvent.UPDATE_CLIENT_ATTRIBUTE, handleUpdateClientAttribute );
		}
		
		protected function handleJoinResult(event:RoomEvent):void
		{
			eventDispatcher.dispatchEvent(new ChatEvent(ChatEvent.CHAT_CONNECTED));
		}
		
		protected function handleChatMessage(fromClient:IClient, messageText:String):void
		{
			var message:ChatMessage = new ChatMessage();
			message.sender = fromClient.getAttribute("USERNAME");
			message.text = messageText;
			
			eventDispatcher.dispatchEvent( new ChatEvent(ChatEvent.MESSAGE_RECEIVED, message));
		}
		
		protected function handleAddClient(event:RoomEvent):void
		{
			var clients:Array = chatRoom.getClients();
		}
		
		protected function handleUpdateClientAttribute(event:RoomEvent):void
		{
			var users:ArrayCollection = new ArrayCollection()
			var clients:Array = chatRoom.getClients();
			for each(var client:IClient in clients)
			{
				if(!client.getAttribute("USERNAME"))
					continue;
				var user:UserVO = new UserVO()
				user.username = client.getAttribute("USERNAME");
				user.chat_id = client.getClientID();
				users.addItem(user);
			}
			
			eventDispatcher.dispatchEvent(new ChatRoomMembersEvent(ChatRoomMembersEvent.MEMBERS_UPDATE_RECEIVED, users));
		}
	}
}