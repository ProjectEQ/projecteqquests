sub EVENT_SPAWN {
	quest::settimer(1,3600);
}

sub EVENT_TIMER {
	quest::depop();
}

sub EVENT_DEATH_COMPLETE{
   quest::unique_spawn(172184,0,0,-1425,576,317,128); # spawn Valdanov Zevfeer
}
