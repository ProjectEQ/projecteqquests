#Live wandering spirit pop
#For experience
#Depops shortly after poping, with or without turn in. Exact timer unknown.
sub EVENT_SPAWN {
  quest::settimer("depop",60);
}

sub EVENT_TIMER {
   quest::depop();
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20608 => 1, 20607 => 1)) { # Unwavering Shield of Faith and Unwavering Sword of Faith
    quest::depop();
    quest::exp(200000);
    quest::ding();
  }
  plugin::return_items(\%itemcount); # return unused items
}