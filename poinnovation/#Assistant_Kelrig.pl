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
quest::spawn2(206078,0,0,-266,-879,3,4); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-314,-880,3,510); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-406,-783,3,130); # NPC: a_manaetic_device
quest::spawn2(206079,0,0,-405,-735,3,126); # NPC: a_manaetic_gadget
quest::spawn2(206079,0,0,-312,-644,3,250); # NPC: a_manaetic_gadget
quest::spawn2(206077,0,0,-263,-642,3,254); # NPC: a_manaetic_contraption
quest::spawn2(206078,0,0,-171,-734,3,376); # NPC: a_manaetic_device
quest::spawn2(206077,0,0,-172,-785,3,386); # NPC: a_manaetic_contraption
  }
}

sub EVENT_SIGNAL {
  quest::settimer(1,240);
  quest::delglobal("poiend");

}

sub EVENT_TIMER {
  quest::say("Excellent. This data will be of great use to us. Thank you for your time. Are you ready to quit?");
  
}
