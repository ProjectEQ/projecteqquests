sub EVENT_SPAWN {
	my $random = int(rand(720)); 
	quest::settimer("pick",$random)
}
sub EVENT_TIMER {
	quest::emote("picks up something from the ground.");
}
