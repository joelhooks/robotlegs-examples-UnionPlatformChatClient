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
package org.robotlegs.examples.bootstrap.service.factories
{
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.rpc.remoting.RemoteObject;

	public class RemoteObjectFactory implements IRemoteObjectFactory
	{
		protected var channelSet:ChannelSet;
		 
		public function RemoteObjectFactory(channelSet:ChannelSet=null)
		{
			this.channelSet = channelSet == null ? new ChannelSet() : channelSet;
		}
		
		public function addChannel(id:String, destination:String):void
		{
			var channel:AMFChannel = new AMFChannel(id, destination);
			channelSet.addChannel(channel);
		}
		
		public function getRemoteObjectForService(destination:String, concurrency:String = "multiple", showBusyCursor:Boolean = true, makeObjectsBindable:Boolean = true):RemoteObject
		{
			var service:RemoteObject = new RemoteObject(destination);
			service.channelSet = this.channelSet;
			service.concurrency = concurrency;
			service.showBusyCursor = showBusyCursor;
			service.makeObjectsBindable = true;	
			return service;
		}
		
		public function destroy():void
		{
			this.channelSet = null;
		}
	}
}