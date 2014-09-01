my $twin_absorbed = 0;

sub EVENT_SPAWN {
  #inactive until golems down
  quest::modifynpcstat("special_attacks","ABfHG");
}

sub EVENT_AGGRO {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if ($timer == 1) {
    if(($x > -470) || ($x < -600) || ($y > -480) || ($y < -810)) {
      $npc->GMMove(-537,-620,-5,2);
    }
  }
  elsif ($timer == 2) {
	#time ran out, go inactive
	quest::modifynpcstat("special_attacks","ABfHG");
	$npc->WipeHateList();
    quest::spawn2(292015,0,0,-567,-875,9,67);
    quest::spawn2(292015,0,0,-572,-911,9,64);
    quest::spawn2(292015,0,0,-514,-911,9,195);
    quest::spawn2(292015,0,0,-514,-875,9,192);
	quest::stoptimer(1);
	quest::stoptimer(2);
  } elsif ($timer eq "absorb_twin") {
    $twin_absorbed = 1;
	$npc->AddAISpell(0, 5117, nuke, -1, -1, -300);
	$npc->AddAISpell(0, 5118, nuke, -1, -1, -1000);
	$npc->AddAISpell(0, 5120, nuke, -1, -1, -400);
	quest::modifynpcstat("max_hit",4800);
	quest::modifynpcstat("special_attacks","SEFQUMCNIDf");
	quest::stoptimer("absorb_twin");
  }
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		#construct of rage died, if none left, go active
		if(!$entity_list->IsMobSpawnedByNpcTypeID(292015)) {
			if (!$twin_absorbed) {
				quest::modifynpcstat("special_attacks","SFQUMCNIDf");
			} else {
				quest::modifynpcstat("special_attacks","SEFQUMCNIDf");
				quest::modifynpcstat("max_hit",4800);
			}
			#30 minutes to kill named
			quest::settimer(2,1800);
		}
	} elsif ($signal == 3) {
		#other twin died
		quest::settimer("absorb_twin",30);
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::creategroundobject(67705,-537,-620,-5,2,3600000);
	#tell other twin I died
	quest::signalwith(292021,3);
	#lockouts
	quest::signalwith(292079, 1);
}