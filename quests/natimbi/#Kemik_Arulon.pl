sub EVENT_SPAWN {
      quest::settimer(1,1);
   
}

sub EVENT_TIMER {
   if ($timer == 1) {
     $npc->SetAppearance(1);
     quest::stoptimer(1);
}
}
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I think I saw a gnoll pup you could probably defeat, a few miles back.");
  }
}