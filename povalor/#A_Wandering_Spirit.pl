sub EVENT_SPAWN {
  quest::settimer("depop",60);
}

sub EVENT_TIMER {
   quest::depop();
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20608 => 1, 20607 => 1)) { #Unwavering Shield of Faith, Unwavering Sword of Faith
    quest::exp(200000);
    quest::ding();
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}