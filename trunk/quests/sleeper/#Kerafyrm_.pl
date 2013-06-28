sub EVENT_SPAWN {
  quest::settimer("zone",1);
}

sub EVENT_TIMER {
 if($timer eq "zone"){
  if($x == 0){
   quest::setglobal("kerafyrm",2,7,"F");
   quest::stoptimer("zone");   
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

sub EVENT_DEATH_COMPLETE { #nearly forgot about this hehe
  quest::setglobal("kerafyrm",3,7,"F"); 
  quest::stoptimer("zone");   
  quest::depop();
}
