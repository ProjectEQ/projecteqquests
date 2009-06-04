sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, {"Klok's Seal"} => 1) { #Nonexistent: Klok's Seal
    quest::say("Oh! thank you! I did not expect to hear of my family ever again. This seal should grant me protection out of the city if I am careful. Please take this note to my father and let him know I am safe!");
    quest::summonitem(26644); #Nonexistent: 'a sealed letter', 'father, I am well, I will be living among the elves now, Love Tayla'
    quest::exp(200);
  }
  else {
    quest::say("I have no use for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:cabeast  ID:Not_Found -- Half 

