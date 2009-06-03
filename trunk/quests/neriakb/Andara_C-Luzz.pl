sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19582 =>1, 19583 =>1, 16166 =>1 )) {
    quest::summonitem(19611);
    quest::say("Well done $name!  Use this with pride.");
    quest::exp(1000);
    quest::ding();
      }
      plugin::return_items(\%itemcount);
      }
