sub EVENT_SPAWN {
  quest::settimer("Caridwi_Spawn", 60);
  $named_up = 0;
}
sub EVENT_SAY {
  if ($text=~/hail/i) {
  quest::say("Beware traveler for behind me lies the way to an ancient temple long since forgotten about. It is within this temple that the trusik have begun a ritual similar to the one that brought the menacing beings known as Muramites. While it may appear to be nothing what you see behind me is a complex illusion placed here by those inside to trick travelers like you. But after losing my life and that of the one I loved to the invading army I am bound here to help those who wish to stop the trusik from damning us again. If you are truly a brave adventurer then just tell me you are [ready] and I will tell you how to get through the facade behind me.");
  }
}
sub EVENT_TIMER {
  $check_caridwi = $entity_list->GetMobByNpcTypeID(291119);
      if($check_caridwi) {
          $named_up = 1;
          }
  if(($zonehour == 4) && ($named_up == 0)){
     quest::spawn2(291119,0,0,-3080,-120,-575,96);
    }
}