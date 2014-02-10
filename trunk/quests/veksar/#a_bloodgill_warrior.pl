sub EVENT_SPAWN {
  quest::setnexthpevent(60);
}

sub EVENT_HP {
  my $random_result = int(rand(100));
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ(); 
  my $h = $npc->GetHeading();

  if (($random_result <= 10) && (defined($qglobals{rage}) && ($qglobals{rage} == 2))) {
    quest::emote("frantically calls for help!");
    quest::spawn2(109093,0,0,$x,$y,$z,$h); ##a_raging_bloodgill_goblin
    quest::setglobal("rage",3,3,"F");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::unique_spawn(109105,0,0,441.44,-378.62,-0.81); # Explorer Gamus
}