sub EVENT_SPAWN {
  quest::settimer(1800);
}
sub EVENT_TIMER {
  quest::spawn2(292021,0,0,$x,$y,$z,$h);
  quest::spawn2(292018,0,0,-1252,-911,8,67);
  quest::spawn2(292018,0,0,-1250,-878,8,64);
  quest::spawn2(292018,0,0,-1193,-911,8,189);
  quest::spawn2(292018,0,0,-1190,-878,8,193);
  quest::depop();
}
sub EVENT_SIGNAL {
  $npc->AddAISpell(5115);
  $npc->AddAISpell(5116);
  $npc->AddAISpell(5119);
  quest::modifynpcstat("max_hit",4800);
  quest::modifynpcstat(SrEQUMCNIDf);
}

sub EVENT_DEATH {
  quest::signal(292022);
}