sub EVENT_SPAWN {
	quest::shout("Are you going to play with me?");
}

sub EVENT_DEATH_COMPLETE {
	quest::shout("That was fun!");
	quest::signal(63109,0); # NPC: Halloween_Trigger
}