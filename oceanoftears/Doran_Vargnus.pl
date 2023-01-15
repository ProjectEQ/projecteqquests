# items: 13995
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13995 =>1 )) {
    quest::say("Thank you, here is your reward.");
    quest::ChooseRandom(3301,3048,3042,3050,3044,20809,7012,3103,3111,3110,7015);
  }
  plugin::return_items(\%itemcount);
}