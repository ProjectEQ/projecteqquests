sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 690 || $x < 500 || $y < -300 || $y > -120) {
    #$npc->GMMove(531,-157,-49,126);
	#send it back to one of the 4 spawn points.
	my $c = quest::ChooseRandom(1,2,3,4);
	if ($c == 1) {
	  $npc->GMMove(566,-212,-50,196);
	} elsif ($c == 2) {
	  $npc->GMMove(632,-147,-50,155);
	} elsif ($c == 3) {
	  $npc->GMMove(611,-146,-50,153);
	} else {
	  $npc->GMMove(575,-272,-50,250);
	}
  }
}
