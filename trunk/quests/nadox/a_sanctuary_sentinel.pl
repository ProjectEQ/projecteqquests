# respawn random mob on a sanctum sentinel death - list favors another sanctuary sentinel
# 90% of the time
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227097;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && (defined $qglobals{krak} && $qglobals{krak}==2)){
  #quest::say("Surprise! Time to die, fool!");
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("krak");
  quest::setglobal("krak",3,3,"F");
  $qglobals{krak}=undef;
  }else{
  #quest::say("Lord Nadox will avenge me!");
  }
}
# EOF zone: nadox NPCs: a_sanctuary_sentinel Captain_Krakskull