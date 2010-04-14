sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Interesting, your abilities have shown you to be sufficient. We would like to continue testing, are you ready to continue or would you like to quit here?");
  }
  if ($text=~/quit/i) {
    quest::say("We shall process the data that you have afforded us. Good bye.");
    quest::selfcast(1090);
  }
  if ($text=~/continue/i) {
    quest::say("Very well, I'll return when you are finished");
    quest::spawn_condition($zonesn,1,1);

  }
}

sub EVENT_SIGNAL {
  quest::settimer(1,360);

}

sub EVENT_TIMER {
  quest::say("Excellent. This data will be of great use to us. Thank you for your time. Goodbye.");
  quest::selfcast(1090);
  quest::depop(206081);
  quest::spawn_condition($zonesn,1,0);
  quest::depop();
  
}