sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 9057 =>1 )) {
    quest::say("I thank the spirits that you have arrived. I would not have been able to stop the dark animist if he were to attempt to leave. He has made camp in an empty set of huts. He has moved from hut to hut, but made no attempt to leave the area. I would be wary of traps if I were you. I must admit that I was afraid. That is why I moved to this location. He should still be there though.");
   quest::summonitem(9062);
    quest::unique_spawn(157116,0,0,-112,595,-259);  
  }
  
  plugin::return_items(\%itemcount);
}