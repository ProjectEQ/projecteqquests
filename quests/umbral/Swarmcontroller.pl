my $count = 0;

sub EVENT_SIGNAL {
  quest::settimer(1,90);
}

sub EVENT_TIMER {
  $count++;
  if($count==1) { #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
    quest::stoptimer(1);
    quest::settimer(1,300);
  }
  if($count==2) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==3) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==4) {  #3x a netherbian ravager and 1x a netherbian flesheater
    quest::spawn2(176114,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==5) {  #4x a netherbian ravager
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }	  
  if($count==6) {  #3x a netherbian ravager and 1x Netherbian Swarmlord
    quest::spawn2(176093,0,0,482,2254,306,128);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
    quest::stoptimer(1);
    $count=0;
  }  
}
