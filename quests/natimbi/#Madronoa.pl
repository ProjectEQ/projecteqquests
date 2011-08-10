sub EVENT_SPAWN {
  quest::settimer("CBQ_Spawn", 60);
}

sub EVENT_TIMER {
  if (!defined($qglobals{CBQ}) && ($zonehour == 0)) {
    quest::unique_spawn(280080,0,0,-64,430,696,45); #Cragbeast Queen
  }
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello $name, how are you today? My name is Madronoa and I have recently returned from the Prayer Grounds of Calling. A group of young adventurers such as yourself led me there some time ago. While there I learned of the geomantic barrier that prevents others from entering and I've learned how to channel the energy of that barrier to teleport those such as yourself there. However, you must have acquired the Fragment and Sliver of the High Temple to be able to get past the unseen force preventing adventurers from entering. If you have both of these pieces and [wish to travel] to Qvic, I shall create a portal for you.");
  }
  if ($text=~/wish to travel/i) {
    if(quest::has_zone_flag(295) == 1 && $qglobals{god_qvic_access} >= 2)   {
      quest::movepc(295,-124,-651,-422,0); #Madrona port in from live as of 05/31/2011
    }
   }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
