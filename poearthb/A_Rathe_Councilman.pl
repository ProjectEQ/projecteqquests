#banish random PC every 60 seconds

sub EVENT_AGGRO {
    quest::settimer("banish_random_client", 60);
}

sub EVENT_DEATH_COMPLETE {
    quest::stoptimer("banish_random_client");
}

sub EVENT_TIMER {
    if($timer == "banish_random_client") {
		my $hate_target = $npc->GetHateRandom();
		$hate_target->CastToClient()->MovePC(222,1864.94, 941.05, -254.0, 0);
		quest::debug($hate_target->GetCleanName() . " has been randomly selected to be banished");
    }
}
