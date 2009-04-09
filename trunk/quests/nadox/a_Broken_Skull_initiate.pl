# respawn named mob on Karsonizzak_Bloodblade (227115) death
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227115; #Karsonizzak_Bloodblade
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($kars==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("kars");
  quest::setglobal("kars",3,3,"F");
  $kars=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#High_Priest_Grumsalot (227114)