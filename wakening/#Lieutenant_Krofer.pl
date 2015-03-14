sub EVENT_SPAWN {
	quest::settimer(1,1500);
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1708 => 1)) { # Mission Report
		quest::say("Failure! Incompetence! The whole squad anihilated! I knew this would happen if left in the hands of a worthless mercenary! Well, you can take this report back to Drioc then. Now get out of my sight, mercenary.");
		quest::exp(1000);
		quest::ding();
		quest::summonitem(1709); # Report of Failure
		quest::depop();
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
	quest::depop();
}

