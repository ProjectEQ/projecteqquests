my $partone=0;

sub EVENT_SPAWN {
  quest::set_proximity($x-25,$x+25,$y-25,$y+25, -999999, 999999, 1);
  quest::enable_proximity_say();
}

sub EVENT_PROXIMITY_SAY {
	#quest::say("kk");
	if ($text=~/Yo ho. No sun!!/i) {
		$partone=1;
		#quest::say("p1");
	}
	elsif ($text=~/A skeleton's day is never done./i && $partone==1) {
		$client->Message(1,"Your voice echoes nicely from the walls");
		$start = $entity_list->GetMobByNpcTypeID(38139);
		$moving = $start->CastToNPC();
		$moving->SignalNPC(1);
		$partone=0;
	}
	else {
		#quest::say("reset");
		$partone=0;
	}
}
