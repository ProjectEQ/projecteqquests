sub EVENT_SPAWN {
  quest::setnexthpevent(99);
}
sub EVENT_HP {
  if($hpevent == 99) {
    quest::spawn2(294622,0,0,680,59,-73,78);
    quest::spawn2(294622,0,0,908,111,-73,150);
    quest::setnexthpevent(90);    
}
  if($hpevent == 90) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
    quest::setnexthpevent(80);
}    
  if($hpevent == 80) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
    quest::setnexthpevent(70);
}    
  if($hpevent == 70) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
    quest::setnexthpevent(60);
}    
  if($hpevent == 60) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
    quest::setnexthpevent(50);
} 
 if($hpevent == 50) {
    quest::spawn2(294622,0,0,680,59,-73,78);
    quest::spawn2(294622,0,0,908,111,-73,150);
    quest::setnexthpevent(40);    
}   
  if($hpevent == 40) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
    quest::setnexthpevent(20);
} 
  if($hpevent == 20) {
    quest::spawn2(294622,0,0,816,125,-73,124);
    quest::spawn2(294622,0,0,761,118,-73,121);
    quest::spawn2(294622,0,0,744,46,-73,101);
    quest::spawn2(294622,0,0,852,73,-73,146);
} 
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294621,0,0,680,59,-73,78);
  quest::spawn2(294621,0,0,937,14,-72,200);
  quest::spawn2(294621,0,0,908,111,-73,150); 
  quest::spawn2(294621,0,0,685,1,-73,57);
  quest::signalwith(294631,8); #set lockout
}
