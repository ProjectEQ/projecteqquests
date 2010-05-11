sub EVENT_SPAWN {
  quest::settimer(1,1);
}

sub EVENT_TIMER {
  if ($timer == 1) {
     $npc->SetAppearance(3);
     quest::stoptimer(1);
}
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("lies shivering and wheezing as her body withers.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}