sub EVENT_SPAWN {
  quest::settimer(1800);
}
sub EVENT_TIMER {
  quest::spawn2(292022,0,0,$x,$y,$z,$h);
  quest::spawn2(292015,0,0,-572,-911,8,64);
  quest::spawn2(292015,0,0,-567,-875,8,66);
  quest::spawn2(292015,0,0,-514,-875,8,192);
  quest::spawn2(292015,0,0,-514,-911,8,195);
  quest::depop();
}
sub EVENT_SIGNAL {
  $npc->AddAISpell(5117);
  $npc->AddAISpell(5118);
  $npc->AddAISpell(5120);
  quest::modifynpcstat("max_hit",4800);
  quest::modifynpcstat(SrEQUMCNIDf);
}

sub EVENT_DEATH {
  quest::signal(292021);
  
}