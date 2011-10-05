# dark elf corruptor shouts before attacking
#

sub EVENT_SPAWN {
  quest::shout("We come for you, fools. Your reign of weakness over the powers of the land comes to an end now!");
  quest::settimer("despawn",180);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
}

# EOF zone: eastkarana ID: 15153 NPC: Dark_Elf_Corruptor

