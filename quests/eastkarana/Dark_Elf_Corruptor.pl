# dark elf corruptor shouts before attacking
#

sub EVENT_SPAWN {
  quest::settimer("despawn", 300);
}

sub EVENT_TIMER {
  quest::stoptimer("despawn");
  quest::depop();
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::stoptimer("despawn");
  }
  else {
    quest::settimer("despawn", 300);
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("despawn");
}

# EOF zone: eastkarana ID: 15153 NPC: Dark_Elf_Corruptor