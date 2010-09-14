sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60154 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 3)) {
  quest::setglobal("ikky",4,5,"F");
  $client->Message(4,"Finished!- You have completed the trial at the Temple of Twin Struggles!");
}
elsif (plugin::check_handin(\%itemcount,60154 =>1 )) {
  quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
  quest::summonitem(60154);
  }
  plugin::return_items(\%itemcount);
}
