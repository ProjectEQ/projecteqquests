sub EVENT_SCALE_CALC {
  # Rarundels Broken Memories: scales with Nihil faction 
  # get faction level with the Nihil
  my $scale = $client->GetModCharacterFactionLevel(231);
    
  # set the scale based on where faction is in the range [0, 1500]
  if($scale < 0) {
    $scale = 0;
  }
  $questitem->SetScale($scale/1500);
}