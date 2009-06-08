sub EVENT_SCALE_CALC {
  # Charm of the Emerald Warrior: scales with Emerald Warriors faction 
  # get faction level with the Emerald Warriors
  my $scale = $client->GetModCharacterFactionLevel(92);
    
  # set the scale based on where faction is in the range [0, 1500]
  if($scale < 0) {
    $scale = 0;
  }
  $questitem->SetScale($scale/1500);
}