# respawn named mob on a #Garodizan_Razorfin (227113) death
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227113;#Garodizan_Razorfin
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($razo==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("razo");
  quest::setglobal("razo",3,3,"F");
  $razo=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#Garodizan_Razorfin (227113)