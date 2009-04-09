# Enestox, Angelox

sub EVENT_DEATH{
 my $random_result = int(rand(100));
 my $a = 227097;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=5) && ($krak==2)){
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("krak");
  quest::setglobal("krak",3,3,"F");
  $krak=undef;
  }else{
  quest::emote("gasps one last breath, then falls.");
 }
}

# EOF zone: nadox NPCs: Captain_Krakskull