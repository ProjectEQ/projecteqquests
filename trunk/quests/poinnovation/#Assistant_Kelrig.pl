sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Interesting, your abilities have shown you to be sufficient. We would like to continue testing, are you ready to continue or would you like to quit here?");
  }
  if ($text=~/quit/i) {
    quest::say("We shall process the data that you have afforded us. Good bye.");
    quest::selfcast(1090);
    quest::depop(206081);
    quest::spawn_condition($zonesn,1,0);
    quest::depop();
  
  }
  if ($text=~/continue/i && defined $qglobals{poiend}) {
    quest::say("Very well, I'll return when you are finished");
quest::spawn2(206078,0,0,-266,-879,3,2);
quest::spawn2(206077,0,0,-314,-880,3,255);
quest::spawn2(206078,0,0,-406,-783,3,65);
quest::spawn2(206079,0,0,-405,-735,3,63);
quest::spawn2(206079,0,0,-312,-644,3,125);
quest::spawn2(206077,0,0,-263,-642,3,127);
quest::spawn2(206078,0,0,-171,-734,3,188);
quest::spawn2(206077,0,0,-172,-785,3,193);
  }
}

sub EVENT_SIGNAL {
  quest::settimer(1,240);
  quest::delglobal("poiend");

}

sub EVENT_TIMER {
  quest::say("Excellent. This data will be of great use to us. Thank you for your time. Are you ready to quit?");
  
}