# respawn named mob on a #First_Mate_Bresanev (227111) death
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227111;#First_Mate_Bresanev
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($bres==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("bres");
  quest::setglobal("bres",3,3,"F");
  $bres=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#First_Mate_Bresanev (227111)