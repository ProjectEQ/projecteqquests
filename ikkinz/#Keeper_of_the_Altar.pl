sub EVENT_SPAWN {
  quest::setnexthpevent(99);
}
sub EVENT_HP {
  if($hpevent == 99) {
    quest::spawn2(294622,0,0,680,59,-73,156);
    quest::spawn2(294622,0,0,908,111,-73,300);
    quest::setnexthpevent(90);    
}
  if($hpevent == 90) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
    quest::setnexthpevent(80);
}    
  if($hpevent == 80) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
    quest::setnexthpevent(70);
}    
  if($hpevent == 70) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
    quest::setnexthpevent(60);
}    
  if($hpevent == 60) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
    quest::setnexthpevent(50);
} 
 if($hpevent == 50) {
    quest::spawn2(294622,0,0,680,59,-73,156);
    quest::spawn2(294622,0,0,908,111,-73,300);
    quest::setnexthpevent(40);    
}   
  if($hpevent == 40) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
    quest::setnexthpevent(20);
} 
  if($hpevent == 20) {
    quest::spawn2(294622,0,0,816,125,-73,248);
    quest::spawn2(294622,0,0,761,118,-73,242);
    quest::spawn2(294622,0,0,744,46,-73,202);
    quest::spawn2(294622,0,0,852,73,-73,292);
} 
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294621,0,0,680,59,-73,156);
  quest::spawn2(294621,0,0,937,14,-72,400);
  quest::spawn2(294621,0,0,908,111,-73,300); 
  quest::spawn2(294621,0,0,685,1,-73,114);
  quest::signalwith(294631,8); #set lockout
}
