sub EVENT_SPAWN {
      quest::settimer(1,1);
   
}

sub EVENT_TIMER {
   if ($timer == 1) {
     $npc->SetAppearance(1);
     quest::stoptimer(1);
}
}