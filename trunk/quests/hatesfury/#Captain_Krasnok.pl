sub EVENT_DEATH { 
     quest::depopall(228122);
     quest::signalwith(228114,333,0);
     quest::signalwith(228115,333,1);
     quest::signalwith(228116,333,2);
     quest::signalwith(228117,333,3);
     quest::signalwith(228118,333,4);
     quest::signalwith(228122,66,5);
}    

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }