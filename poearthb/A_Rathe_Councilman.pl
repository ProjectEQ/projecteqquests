#banish random PC every 60 seconds

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::settimer("banish_random_client", 60);
  }
  else {
    quest::stoptimer("banish_random_client");
  }
}

sub EVENT_DEATH_COMPLETE {
    quest::stoptimer("banish_random_client");
}

sub EVENT_TIMER {
    if($timer eq "banish_random_client" && !$mob->IsMezzed()) {
		my $hate_target = $npc->GetHateRandom();
		if ($hate_target->IsClient())
		{
			$hate_target->CastToClient()->MovePC(222,1864.94, 941.05, -254.0, 0);
		}
		quest::debug($hate_target->GetCleanName() . " has been randomly selected to be banished");
    }
}
