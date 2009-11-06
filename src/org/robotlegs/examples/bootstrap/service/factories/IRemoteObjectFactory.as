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
	import mx.rpc.remoting.RemoteObject;

	public interface IRemoteObjectFactory
	{
		function addChannel(id:String, destination:String):void;
		function getRemoteObjectForService(destination:String, concurrency:String = "multiple", showBusyCursor:Boolean = true, makeObjectsBindable:Boolean = true):RemoteObject;
		function destroy():void;
	}
}