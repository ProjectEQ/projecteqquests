# items: 19582, 19583, 16166, 19611
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19582 =>1, 19583 =>1, 16166 =>1 )) {
    quest::summonitem(19611); # Item: Ebon Short Bow
    quest::say("Well done $name!  Use this with pride.");
    quest::exp(1000);
    quest::ding();
      }
      plugin::return_items(\%itemcount);
      }
