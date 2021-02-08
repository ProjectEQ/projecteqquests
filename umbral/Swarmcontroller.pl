my $count = 0;

sub EVENT_SIGNAL {
  quest::settimer(1,90);
}

sub EVENT_TIMER {
  $count++;
  if($count==1) { #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,270); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::me("The earth rumbles as netherbians swarm to attack");
    quest::stoptimer(1);
    quest::settimer(1,300);
  }
  if($count==2) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,270); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::me("The earth rumbles as netherbians swarm to attack");
  }
  if($count==3) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,270); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::me("The earth rumbles as netherbians swarm to attack");
  }
  if($count==4) {  #3x a netherbian ravager and 1x a netherbian flesheater or #a_netherbian_hive_fiend
    quest::spawn2(quest::ChooseRandom(176116,176114),0,0,487,2281,302,270); # NPC(s): #a_netherbian_hive_fiend (176116), #a_netherbian_flesheater (176114)
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::me("The earth rumbles as netherbians swarm to attack");
  }
  if($count==5) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,270); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::me("The earth rumbles as netherbians swarm to attack");
  }	  
  if($count==6) {  #3x a netherbian ravager and 1x Netherbian Swarmlord
    quest::spawn2(176093,0,0,482,2254,306,256); # NPC: Netherbian_Swarmlord
    quest::spawn2(176113,0,0,455,2253,305,128); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,475,2229,305,28); # NPC: #a_netherbian_ravager
    quest::spawn2(176113,0,0,504,2258,304,368); # NPC: #a_netherbian_ravager
    quest::stoptimer(1);
    $count=0;
  }  
}
