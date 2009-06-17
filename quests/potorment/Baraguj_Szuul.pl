my $timerstarted = 0;
sub EVENT_ATTACK {

		quest::movepc(207,-1094,910,-746,0);
		if ($timerstarted) { 
                     quest::stoptimer(1); 
                     }
                else {
                     quest::settimer(2,1800);
                     $timerstarted = 1;
                     }
                $client->Message(15,"You have 30 minutes");
		quest::settimer(1,300);
	}

sub EVENT_TIMER {
		quest::signal(207071);
		quest::depop();
}