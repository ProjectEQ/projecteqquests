# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227108;#Crew_Chief_Hanriesaf
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($hanr==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("hanr");
  quest::setglobal("hanr",3,3,"F");
  $hans=undef;
  }else{
  #do nothing
 }
}

# EOF zone: nadox NPCs: #Crew_Chief_Hanriesaf (227108)