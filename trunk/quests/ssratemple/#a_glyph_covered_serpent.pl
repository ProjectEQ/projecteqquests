# triggers vyzh`dra the exiled on death
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
  quest::signalwith(162255,2,0);
  quest::setglobal("glyphed_dead",1,3,"D3");
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162261 NPC: #a_glyph_covered_serpent

