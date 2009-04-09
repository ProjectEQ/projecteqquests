# vyzh`dra the cursed misc. ramblings
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_SLAY {
  quest::shout("Tell your gods that I will be coming for them next!");
}

sub EVENT_DEATH {
  quest::shout("I cannot die! I am the only true god!");
  quest::emote("crashes to the ground. A horrific sound fills the room, but vanishes as quickly as it came.");
  quest::stoptimer("despawn");
  quest::setglobal("cursed_dead",1,3,"D3");
  quest::signalwith(162255,4,0);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162206 NPC: #Vyzh`dra_the_Cursed

