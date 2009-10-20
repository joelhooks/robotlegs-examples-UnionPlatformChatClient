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
	import org.robotlegs.mvcs.Service;

	public class UnionChatService extends Service implements IChatService
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