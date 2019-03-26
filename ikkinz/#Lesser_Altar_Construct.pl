sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if($x > 690 || $x < 500 || $y < -300 || $y > -120) {
    #$npc->GMMove(531,-157,-49,252);
	#send it back to one of the 4 spawn points.
	my $c = quest::ChooseRandom(1,2,3,4);
	if ($c == 1) {
	  $npc->GMMove(566,-212,-50,392);
	  $npc->CastSpell(3791, $npc->GetID()); # Spell: Ocean's Cleansing
	  $npc->WipeHateList();
	} elsif ($c == 2) {
	  $npc->GMMove(632,-147,-50,310);
	  $npc->CastSpell(3791, $npc->GetID()); # Spell: Ocean's Cleansing
	  $npc->WipeHateList();
	} elsif ($c == 3) {
	  $npc->GMMove(611,-146,-50,306);
	  $npc->CastSpell(3791, $npc->GetID()); # Spell: Ocean's Cleansing
	  $npc->WipeHateList();
	} else {
	  $npc->GMMove(575,-272,-50,500);
	  $npc->CastSpell(3791, $npc->GetID()); # Spell: Ocean's Cleansing
	  $npc->WipeHateList();
	}
  }
}
