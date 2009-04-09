# triggers vyzh`dra the banished/exiled on death
#

sub EVENT_SPAWN {
  quest::settimer("despawn",3600);
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
  quest::signalwith(162255,2,0)
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

# EOF zone: ssratemple ID: 162253 NPC: #a_rune_covered_serpent

