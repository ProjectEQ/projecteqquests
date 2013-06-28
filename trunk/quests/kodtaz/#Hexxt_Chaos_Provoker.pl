sub EVENT_SPAWN {
  quest::settimer(81, 6);
}

sub EVENT_TIMER {
  if ($z > -437 && $timer == 81) {
    $npc->SetHP($npc->GetMaxHP());
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer(81);
  quest::depop(293212);
  quest::spawn2(293113,0,0,591,746,-460,75);
}