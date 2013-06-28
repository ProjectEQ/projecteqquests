sub EVENT_SPAWN {
  quest::emote("strides forward to deal with its enemies.");
}

sub EVENT_DEATH_COMPLETE {
  quest::setglobal("uquaragedoor",1,3,"H6");
}