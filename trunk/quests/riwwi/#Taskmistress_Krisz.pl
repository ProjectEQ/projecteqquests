sub EVENT_SPAWN {
  quest::shout("Kekken, Uxnikk! What are you fools doing?");
}

sub EVENT_DEATH {
  quest::setglobal("taskmistress",0,7,"D3");
}