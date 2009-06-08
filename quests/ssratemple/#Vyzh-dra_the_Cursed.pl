sub EVENT_SLAY {
	quest::shout("Tell your gods that I will be coming for them next!");
}

sub EVENT_DEATH {
	quest::shout("I cannot die! I am the only true god!");
	quest::emote("crashes to the ground. A horrific sound fills the room, but vanishes as quickly as it came.");
	quest::signalwith(162255,3,0);
}
