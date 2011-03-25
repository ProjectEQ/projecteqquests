sub EVENT_SPAWN {
  quest::settimer(81, 6);
}

sub EVENT_TIMER {
  if ($z > -437 && $timer == 81) {
    $npc->SetHP($npc->GetMaxHP());
  }
}

sub EVENT_DEATH {
  quest::stoptimer(81);
}