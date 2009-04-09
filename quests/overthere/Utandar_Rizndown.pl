sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say(" It is good to see our numbers growing on this land.
Welcome! May your travels be as prosperous as mine have.
There are many [new powers] to be gained from this land.");
  }
  if($text=~/new powers/i){
    quest::say(" The new powers are scrolls that give us access to new and powerful spells.
My collection is almost complete. I am simply [lacking] four more and then I will return back to the homeland.");
  }
  if($text=~/lacking/i){
    quest::say(" I am missing the scroll Atol's Spectral Shackles, Tears of Druzzil, Inferno of Al'kabor, and Pillar of Frost. Should you run into one, bring it to me and I'll perform an exchange for another scroll.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19315 => 1) || # Atol's spectral shackles
      plugin::check_handin(\%itemcount, 19322 => 1) || # Inferno of Al Kabor
      plugin::check_handin(\%itemcount, 19318 => 1) || # Pillar of frost
      plugin::check_handin(\%itemcount, 19319 => 1)) { # Tears of druzzil
  #tokyo2001 & Allakhazam don't have any text for the rewards, so i kept the text from FV's NPC.
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19329,19320,19324,19317));
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}


#END of FILE Zone:overthere  ID:84166 -- Utandar Rizndown


