# Quest to return boats to their spawn points after an hour without use
# by RealityIncarnate

# The boat receives a signal (id 0) whenever the server gets a ControlBoat opcode
sub EVENT_SIGNAL {
  quest::stoptimer("respawn");		# stop any respawn countdown in progress
  quest::settimer("checkuse", 60);	# begin checking for use every minute
}

sub EVENT_TIMER {
  if($timer eq "checkuse") {
    if(!$npc->GetTarget()) {		# if the boat has a target, it's in use.  If not, begin the respawn timer
      quest::stoptimer("checkuse");	# stop checking for use
      quest::settimer("respawn",3600); 	# start the respawn timer at 1 hour
    }
  }
  if($timer eq "respawn") {
    quest::respawn($mobid,0);		# it hasn't been used for an hour, so respawn the boat		
  }
}