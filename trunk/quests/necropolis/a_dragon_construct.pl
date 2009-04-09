sub EVENT_SPAWN {
  quest::settimer("crumble",5);
}

sub EVENT_TIMER {
  if ($timer eq "crumble") {
    $npc->SetAppearance(3);
    quest::stoptimer("crumble");
  }
}

sub EVENT_ATTACK {
  $npc->SetAppearance(0);
}

# EOF zone: necropolis NPC: a_dragon_construct

