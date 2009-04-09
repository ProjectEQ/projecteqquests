sub EVENT_ATTACK {

		quest::movepc(207,-1094,910,-746,0);
		quest::stoptimer(1);
                $client->Message(15,"You have 30 minutes");
		quest::settimer(1,300);
	}

sub EVENT_TIMER {

	if($timer == 1) {

		quest::signal(207071);
		quest::depop();

	}
}