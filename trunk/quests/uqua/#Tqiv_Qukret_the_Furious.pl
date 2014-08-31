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
    if(($x > -1160) || ($x < -1290) || ($y > -480) || ($y < -810)) {
      $npc->GMMove(-1227,-628,-5,0);
    }
  }
  elsif ($timer == 2) {
    #time ran out, go inactive
	quest::modifynpcstat("special_attacks","ABfHG");
	$npc->WipeHateList();
    quest::spawn2(292018,0,0,-1252,-911,8,67);
    quest::spawn2(292018,0,0,-1250,-878,8,64);
    quest::spawn2(292018,0,0,-1193,-911,8,189);
    quest::spawn2(292018,0,0,-1190,-878,8,193);
	quest::stoptimer(1);
	quest::stoptimer(2);
  } elsif ($timer eq "absorb_twin") {
	  $twin_absorbed = 1;
	  $npc->AddAISpell(0, 5115, Nuke, -1, -1, -350);
	  $npc->AddAISpell(0, 5116, Nuke, -1, -1, -250);
	  $npc->AddAISpell(0, 5119, Nuke, -1, -1, -350);
	  quest::modifynpcstat("max_hit",4800);
	  quest::modifynpcstat("special_attacks","SEFQUMCNIDf");
	  quest::stoptimer("absorb_twin");
  }
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		#construct of fury died, if none left, go active
		if(!$entity_list->IsMobSpawnedByNpcTypeID(292018)) {
			if (!$twin_absorbed) {
				quest::modifynpcstat("special_attacks","SEQUMCNIDf");
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
	quest::creategroundobject(67706,-1227,-628,-5,0,3600000);
	#tell other twin I died
	quest::signalwith(292022,3);
	#lockouts
	quest::signalwith(292079, 1);
}