sub EVENT_SPAWN {
   quest::emote("runs up and steals the note.");
  quest::say("Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note and now I shall take it to my superior!! Just try and catch me!!");
  quest::faction( 281,1 ); # Faction: Knights of Truth
    quest::faction( 271,-1 ); # Faction: Dismal Rage
    quest::faction( 330,-1 ); # Faction: The Freeport Militia
    quest::faction( 311,1 ); # Faction: Steel Warriors
    quest::faction( 362,1 ); # Faction: Priests of Marr
    quest::settimer(1,10);
    quest::settimer(2,600);
}

sub EVENT_TIMER {
  if($timer == 1) {
  quest::stoptimer(1);
  quest::start(2);
  }
  if($timer == 2) {
  quest::depop();
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Your name shall be added to the most wanted list of the Freeport Militia!!");
}


sub EVENT_ITEM {
   plugin::return_items(\%itemcount);  
}
