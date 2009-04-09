# respawn random mob on a a_Broken_Skull_sycophant death - list favors another a_Broken_Skull_sycophant
# 95% of the time
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227102;#a_Broken_Skull_Peer
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($peer==2)){
  quest::spawn2($a,1,0,$x,$y,$z,$h);
  quest::delglobal("peer");
  quest::setglobal("peer",3,3,"F");
  $peer=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs: a_Broken_Skull_sycophant, a_Broken_Skull_Peer