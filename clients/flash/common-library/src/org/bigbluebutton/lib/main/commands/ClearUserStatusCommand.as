package org.bigbluebutton.lib.main.commands {
	
	import org.bigbluebutton.lib.main.models.IConferenceParameters;
	import org.bigbluebutton.lib.main.models.IUserSession;
	import org.bigbluebutton.lib.user.services.IUsersService;
	
	import robotlegs.bender.bundles.mvcs.Command;
	
	public class ClearUserStatusCommand extends Command {
		
		[Inject]
		public var conferenceParameters:IConferenceParameters;
		
		[Inject]
		public var userSession:IUserSession;
		
		[Inject]
		public var userService:IUsersService;
		
		[Inject]
		public var userID:String;
		
		override public function execute():void {
			trace("ClearUserStatusCommand.execute() - clear status");
			if (conferenceParameters.serverIsMconf) {
				userService.clearUserStatus(userID);
			} else {
				userService.lowerHand(userID, userSession.userList.me.userID);
			}
		}
	}
}
