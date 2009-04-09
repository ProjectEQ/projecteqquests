#Flotsam.pl
#Part of Stoicism
#Script to depop Flotsam if it hasn't died in an hour

sub EVENT_SPAWN{
	quest::settimer("depop", 3600);#1 hour on this timer
}

sub EVENT_TIMER{
	if ($timer == "depop"){
		quest::stoptimer("depop");
		quest::depop();
	}
}#Done