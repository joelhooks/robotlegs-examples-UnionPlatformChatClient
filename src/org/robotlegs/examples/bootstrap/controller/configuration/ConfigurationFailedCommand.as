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
package org.robotlegs.examples.bootstrap.controller.configuration
{
	import org.robotlegs.mvcs.Command;
	
	public class ConfigurationFailedCommand extends Command
	{
		override public function execute():void
		{
			trace("configuration failed");
		}
	}
}