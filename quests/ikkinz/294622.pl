sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($y < -80 || $y > 190 || $x < 640 || $x > 980) {
    #choose randomly between the 6 spawn points in the room where to send the mob if it tethers.
 	my $c = quest::ChooseRandom(1,2,3,4,5,6);
	if ($c == 1) {
	  $npc->GMMove(680,59,-73,78);
	} elsif ($c == 2) {
	  $npc->GMMove(908,111,-73,150);
	} elsif ($c == 3) {
	  $npc->GMMove(816,125,-73,124);
	} elsif ($c == 4) {
	  $npc->GMMove(761,118,-73,121);
	} elsif ($c == 5) {
	  $npc->GMMove(744,46,-73,101);
	} else {
	  $npc->GMMove(852,73,-73,146);
	}
  }
}