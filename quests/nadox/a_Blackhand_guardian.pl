# respawn named mob on a #High_Priest_Grumsalot (227114) death
# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227114;#High_Priest_Grumsalot
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && (defined $qglobals{grums} && $qglobals{grums}==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("grums");
  quest::setglobal("grums",3,3,"F");
  $qglobals{grums}=undef;
  }else{
  #do nothing 
 }
}

# EOF zone: nadox NPCs:#High_Priest_Grumsalot (227114)