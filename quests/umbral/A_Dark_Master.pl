# part of doomshade trigger
#


sub EVENT_SPAWN {
  quest::settimer("chant",600);
}

sub EVENT_TIMER {
  if ($timer eq "chant") {
    $check_scream = $entity_list->GetMobByNpcTypeID(176087);
    if ($check_scream) {
      quest::signalwith(176105,299,0);
    }
  }
}

sub EVENT_DEATH {
  $check_wail = $entity_list->GetMobByNpcTypeID(176105);
  if ($check_wail) {
    quest::signalwith(176087,99,0);
    quest::signalwith(176087,199,1000);
  }
}

# EOF ZONE: umbral ID: 176042 NPC: A_Dark_Master

