sub EVENT_SPAWN {
  quest::settimer(81, 6);
}

sub EVENT_TIMER {
  if ($z > -437) {
    $npc->SetHP($npc->GetMaxHP());
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer(81);
}