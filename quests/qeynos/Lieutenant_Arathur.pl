
sub EVENT_WAYPOINT_ARRIVE {
  if($wp == 12) {
    quest::say("Guard, stand up straight!");
	quest::signal(1002,1);
	quest::signal(1181,1);
	}
  if($wp == 28) {
    quest::say("Guard, stand up straight!");
	quest::signalwith(1090, 1, 1);
	quest::signalwith(1091, 1, 1);
	}
  if($wp == 38) {
    quest::say("Guard, stand up straight!");
	quest::signal(1001,1);
	quest::signal(1189,1);
	quest::signal(1006,1);
	quest::signal(1174,1);
  }
}
