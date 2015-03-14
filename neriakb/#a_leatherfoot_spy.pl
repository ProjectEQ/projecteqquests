##a_leatherfoot_spy.pl
#Part of Innoruuk Disciple

sub EVENT_SPAWN{
	quest::say("I have been discovered!!! You will never stop us from reclaiming the Nektulos for Karana, $name!!");
	quest::settimer("depop", 3600);
}#Done

sub EVENT_TIMER{
	if ($timer == "depop"){
		quest::stoptimer("depop");
		quest::depop();
	}
}