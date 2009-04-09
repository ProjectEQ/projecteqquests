sub EVENT_SPAWN {
        quest::settimer(1,60);
	quest::shout("Ah, finally some people interested in the Haunted Hunt! I'm your first target, and probably your last too! Hahaha!");
}

sub EVENT_TIMER {
        quest::shout("Ah, finally some people interested in the Haunted Hunt! I'm your first target, and probably your last too! Hahaha!");
}

sub EVENT_DEATH {
	quest::shout("GAH! I've been bested! No matter, you will not defeat the next!");
	quest::spawn2(63100,0,0,206,850,3.1,140.5);
        quest::stoptimer(1);
}