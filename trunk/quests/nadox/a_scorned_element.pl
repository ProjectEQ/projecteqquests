# respawn named mob on #a_lava_etched_doombringer (227104) death
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227104;#a_lava_etched_doombringer
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($lava==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("lava");
  quest::setglobal("lava",3,3,"F");
  $lava=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#a_lava_etched_doombringer (227104)