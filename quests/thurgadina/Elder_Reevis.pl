sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("WHY, HELLO THAR, YOUNG LAD! GREAT DAY FER IT, AIN'T IT? YESSIREE! WHY THIS REMINDS ME O' THE DAYS BACK WHEN WE'D GATHER ROUND THE FIRE LIKE THIS AND.... OH. HELLO THAR, YOUNG LAD!  ER...  WHAT WAS I SAYIN'?");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:thurgadina  ID:Not_Found -- Elder_Reevis