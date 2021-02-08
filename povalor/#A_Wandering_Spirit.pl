# items: 20608, 20607
sub EVENT_SPAWN {
  quest::settimer("depop",60);
}

sub EVENT_TIMER {
   quest::depop();
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20608 => 1, 20607 => 1)) { #Unwavering Shield of Faith, Unwavering Sword of Faith
    quest::say("A Wandering Spirit looks at you with surprise. It's been quite some time since I've been without my weaponry. Thank you for returning them to me $name.");
    quest::exp(200000);
    quest::ding();
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}
