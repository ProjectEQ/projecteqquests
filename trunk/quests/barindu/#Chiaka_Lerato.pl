sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("ignores your attempts to talk to her.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 64010 =>1 )) {
    quest::say("I know of your plot and I have no interest in being a part of it. It's too dangerous and more likely to get us all killed than set us free. I don't want anyone else getting hurt, so I won't tell the guards, but I will have no part in your plans.");
    quest::summonitem(64010);
  }
  if (plugin::check_handin(\%itemcount, 64008 =>1 )) {
    quest::say("How did you. . . Never mind. I'd know this shawl anywhere and it can only mean one thing. Mother needs me. I haven't heard from my brother or mother since they escaped and I thought they might be dead. I should have left with them when I had the chance. Fortunately, Hamisi told me of his plans. I should be able to use the same route he did to escape. Here, take this. I won't need it any more.");
    quest::summonitem(64009);
    quest::start(56);
    quest::exp(10000);
  }
  plugin::return_items(\%itemcount);
}
sub EVENT_WAYPOINT_ARRIVE {
   if($wp == 9) {
    quest::depop();
  }
} 
