sub EVENT_AGGRO {
	quest::say("These mines are property of the grimling empire!  You have trespassed and now you die!");
}

sub EVENT_DEATH {
	quest::emote("slumps to the ground in a puddle of dark blood.");
}