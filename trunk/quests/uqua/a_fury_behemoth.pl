sub EVENT_SPAWN {
  quest::emote("strides forward to deal with its enemies.");
}

sub EVENT_DEATH {
  quest::setglobal("uquafurydoor",1,3,"H6");
}