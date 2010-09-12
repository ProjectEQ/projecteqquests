sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Gah, what do you think you're doing causing all that ruckus? I'm trying to keep a low profile so no wandering Muramites come to investigate noise. I may be the liaison for this temple, but that doesn't mean you can blow my cover! In any case, you still need to find Gazak and attempt the first trial before you can go any farther! Now make haste!");
  }
}
sub EVENT_ITEM {
  if ((plugin::check_handin(\%itemcount, 60153 =>1 )) && (defined $qglobals{ikky} && $qglobals{ikky} == 2)) {
  quest::setglobal("ikky",3,5,"F");
  $client->Message(4,"Finished!- You have completed the trial at the Temple of Twin Struggles!");
}
elsif (plugin::check_handin(\%itemcount,60153 =>1 )) {
  quest::say("I appreciate that you must have fought hard for this, but I cannot accept it yet. Please speak with Kevren Nalavat about the trials and once I have received word that you are actually ready to do the trials, you can present it to me again.");
  quest::summonitem(60153);
  }
  plugin::return_items(\%itemcount);
}
