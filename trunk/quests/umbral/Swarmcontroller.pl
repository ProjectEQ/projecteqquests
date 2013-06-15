sub EVENT_SIGNAL {
  quest::settimer(1,300);
}

sub EVENT_TIMER {
  my $count = 0;
  $count++;
  if($count==1) {
    if(!$entity_list->GetMobByNpcTypeID(176007)) {
	  quest::spawn2(176113,0,0,487,2281,302,135);
	  quest::spawn2(176113,0,0,455,2253,305,64);
	  quest::spawn2(176113,0,0,475,2229,305,14);
	  quest::spawn2(176113,0,0,504,2258,304,184);
	}
	else {
	  quest::stoptimer(1);
	  $count=0;
	}
  }
  if($count==2) {
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==3) {
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==4) {
    quest::spawn2(176114,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }
  if($count==5) {
    quest::spawn2(176113,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
  }	  
  if($count==6) {
    quest::spawn2(176093,0,0,487,2281,302,135);
    quest::spawn2(176113,0,0,455,2253,305,64);
    quest::spawn2(176113,0,0,475,2229,305,14);
    quest::spawn2(176113,0,0,504,2258,304,184);
    quest::stoptimer(1);
    $count=0;
  }  
}
