sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, traveler. I'm the keeper of possessions for the Skyshrine. Any friend of the shrine can safely store their belongings with me.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
  if($signal == 66) {
     quest::shout("BEWARE! BEWARE! The Sleeper has been awakened! He means death for all who remain here! Time is short, flee the Skyshrine now if you value your life!");
  }
}
#END of FILE Zone:skyshrine  ID:Not_Found -- Pyrox