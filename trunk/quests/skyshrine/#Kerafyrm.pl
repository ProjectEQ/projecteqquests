sub EVENT_SPAWN {
  quest::settimer("despawn",1);
}

sub EVENT_TIMER {
 if($timer eq "despawn"){
  if($x == 1970 && $y == 2593){
   quest::setglobal("kerafyrm",3,7,"F");
   quest::stoptimer("despawn");   
   quest::depop();
  }
 }
}

sub EVENT_SLAY {
  quest::shout("Begone insect, I have much slaying yet to do!");
}

sub EVENT_NPC_SLAY {
  quest::shout("Begone insect, I have much slaying yet to do!");
}

sub EVENT_DEATH { #nearly forgot about this hehe
  quest::setglobal("kerafyrm",3,7,"F"); 
  quest::stoptimer("despawn");   
  quest::depop();
}
