# respawn random mob on a sanctum sentinel death - list favors another sanctum sentinel
# 90% of the time
# Angelox, Enestox

sub EVENT_DEATH_COMPLETE{
 my $random_result = int(rand(100));
 my $a = 227097;
 my $x = $npc->GetX();
 my $y = $npc->GetY();
 my $z = $npc->GetZ(); 
 my $h = $npc->GetHeading();
 if (($random_result<=10) && ($krak==2)){
  #quest::say("Surprise! Time to die, fool!");
  quest::spawn2($a,0,0,$x,$y,$z,$h);
  quest::delglobal("krak");
  quest::setglobal("krak",3,3,"F");
  $krak=undef;
  }else{
  quest::say("This space has been violated, I am shamed.");
  }
}

# EOF zone: nadox ID: 227038 227034 227097 NPC: a_sanctum_sentinel Captain_Krakskull