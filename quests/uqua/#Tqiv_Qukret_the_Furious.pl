sub EVENT_SPAWN {
  quest::settimer(2,1800);
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
    quest::spawn2(292021,0,0,$x,$y,$z,$h);
    quest::spawn2(292018,0,0,-1252,-911,8,67);
    quest::spawn2(292018,0,0,-1250,-878,8,64);
    quest::spawn2(292018,0,0,-1193,-911,8,189);
    quest::spawn2(292018,0,0,-1190,-878,8,193);
    quest::depop();
  }
}

sub EVENT_SIGNAL {
  $npc->AddAISpell(5115);
  $npc->AddAISpell(5116);
  $npc->AddAISpell(5119);
  quest::modifynpcstat("max_hit",4800);
  quest::modifynpcstat("special_attacks","SrEQUMCNIDf");
}

sub EVENT_DEATH_COMPLETE {
	quest::creategroundobject(67706,-1227,-628,-5,0,3600000);
  quest::signal(292022);
	quest::signalwith(292079, 1);
}