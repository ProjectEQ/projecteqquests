sub EVENT_SPAWN {
	quest::settimer("mangler",720);
}
sub EVENT_TIMER {
	quest::say("<Bark, bark, bark! Hoooooowwwwwwl!>");
	quest::signal(19049,1);
}
