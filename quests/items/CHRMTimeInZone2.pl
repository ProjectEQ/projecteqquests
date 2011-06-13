sub EVENT_SCALE_CALC {
  if (!defined($whimsy{$name})) {
    $whimsy{$name} = 0; #Initialize player counter
  }
  foreach $player (keys %whimsy) {
    if (!$entity_list->GetClientByName($player)) {
      delete ($whimsy{$player}); #Remove counters for players no longer in zone
    }
  }
  if ($whimsy{$name} < 120) { #120 minutes
    $whimsy{$name}++;
  }
  $questitem->SetScale($whimsy{$name}/120);
}
