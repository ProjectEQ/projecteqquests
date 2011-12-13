sub EVENT_SPAWN {
  quest::settimer(2,1800);
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
    quest::spawn2(292021,0,0,$x,$y,$z,$h);
    quest::spawn2(292018,0,0,-1252,-911,8,67);
    quest::spawn2(292018,0,0,-1250,-878,8,64);
    quest::spawn2(292018,0,0,-1193,-911,8,189);
    quest::spawn2(292018,0,0,-1190,-878,8,193);
    quest::depop();
  }
}

sub EVENT_SIGNAL {
  $npc->AddAISpell(5117);
  $npc->AddAISpell(5118);
  $npc->AddAISpell(5120);
  quest::modifynpcstat("max_hit",4800);
  quest::modifynpcstat("special_attacks","SrEQUMCNIDf");
}

sub EVENT_DEATH {
  quest::signal(292021);
}