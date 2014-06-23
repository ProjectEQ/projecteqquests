sub EVENT_SPAWN {
  quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant_Mi`Ta
} 

sub EVENT_SIGNAL {
  if ($signal == 43) {
    quest::settimer("3hours",10800); #reset after 3 hours if not completed.
  }
  if ($signal == 333) {
    quest::stoptimer("3hours");
    quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant_Mi`Ta
  }
}

sub EVENT_TIMER {
  if ($timer eq "3hours") {
    quest::stoptimer("3hours");
    quest::spawn2(228010,0,0,-1112,-46,-285.58,60); #Attendant_Mi`Ta
    quest::signalwith(228121,66,0); #Captain_Krasnok
    quest::signalwith(228122,66,0); #Fist_of_Krasnok
    quest::signalwith(228114,333,0); #bleeding_spell
    quest::signalwith(228115,333,0); #drowning_spell
    quest::signalwith(228116,333,0); #hate_spell
    quest::signalwith(228117,333,0); #languish_spell
  }
}