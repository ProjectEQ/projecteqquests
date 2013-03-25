sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met, friend. May I be of assistance?");
  }
}

sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 6265 =>1 )) {
  quest::say("Ah so there you are we've been expecting you. Take this spear and go speak with Arms Historian Qua. He can provide further instructions.");
  quest::summonitem(6147);
}
if (plugin::check_handin(\%itemcount, 5544 =>1, 6268 =>1 )) {
  quest::say("Well done #name!  You have proven your worth and can now be considered a Dar Khura Journeyman!");
  quest::summonitem(6268);
  quest::summonitem(6267);
  quest::exp(10000);
}
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:sharvahl  ID:Not_Found -- Amat_Iuziq