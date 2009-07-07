sub EVENT_SPAWN {
  quest::settimer("CourierDepop", 10);
  quest::SetRunning(1);
}

sub EVENT_TIMER {
  if($x == 1150 && $y == -885) { #Teir`Dal Camp
    quest::stoptimer("CourierDepop");
    quest::depop();
  }
  if(quest::IsRunning()==0) {
    quest::SetRunning(1);
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}