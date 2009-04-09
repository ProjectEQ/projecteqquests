# one of ten shissar to be killed to start the cursed cycle
#
sub EVENT_SPAWN {
  quest::spawn2(162255,0,0,290,446,-114,124);
}

sub EVENT_DEATH {
  quest::signalwith(162255,1,0);
}


# EOF zone: ssratemple ID: 162258 NPC: 162258

