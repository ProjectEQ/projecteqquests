# dark elf reaver - ranger/druid epic
#

sub EVENT_SPAWN {
  quest::settimer("despawn",600);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

sub EVENT_DEATH {
  quest::stoptimer("despawn");
}

# EOF zone: eastkarana ID: 15150 NPC: Dark_Elf_Reaver

