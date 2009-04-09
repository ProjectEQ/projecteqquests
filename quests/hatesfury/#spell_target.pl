sub EVENT_SPAWN {
     quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant
} 

sub EVENT_SIGNAL {
  if ($signal == 43){
     quest::settimer("3hours",10800); #reset after 3 hours if not completed.
}
  if ($signal == 333){
     quest::stoptimer("3hours");
     quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant
}
 }
 
sub EVENT_TIMER {
 if ($timer eq "3hours") {
     quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant
     quest::stoptimer("3hours");
     quest::signalwith(228121,66,0);
     quest::signalwith(228122,66,1);
     quest::signalwith(228114,333,2);
     quest::signalwith(228115,333,3);
     quest::signalwith(228116,333,4);
     quest::signalwith(228117,333,5);
}    
 }