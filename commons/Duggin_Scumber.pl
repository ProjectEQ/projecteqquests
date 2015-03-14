sub EVENT_SPAWN {
   quest::emote("runs up and steals the note.");
  quest::say("Aha!! Foolish Qeynite or whatever you call yourself!! I have found the note and now I shall take it to my superior!! Just try and catch me!!");
  quest::faction( 184,1 );
    quest::faction( 86,-1 );
    quest::faction( 105,-1 );
    quest::faction( 311,1 );
    quest::faction( 258,1 );
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
