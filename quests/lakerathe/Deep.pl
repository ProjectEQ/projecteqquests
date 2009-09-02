# Monk Epic 1.0

sub EVENT_SAY {
  quest::emote("ignores you.");
}

sub EVENT_ITEM {
  if((plugin::check_handin(\%itemcount, 1686 => 1)) && ($ulevel >= 46) && ($class eq "Monk")) { #Trunt's Head
    quest::emote("slowly opens her eyes and looks up at you. She stares at you a long while and then closes her eyes and lowers her head again.");
    quest::say("Very well, $name, if you wish death so greatly, we will be happy to oblige. My master projects part of himself in the wilder lands known as the Overthere. He has granted you an audience. Find him and show him the head of our earth brother. At that point, we will discuss how we will end your life.");
    quest::summonitem(1686); #Trunt's Head
    quest::setglobal("Trunt",1,5,"F");
    quest::depop();
  }
  else {
    quest::say("I have no use for this, $name.");
    quest::return_items(\%itemcount);
  }
}
# End of File