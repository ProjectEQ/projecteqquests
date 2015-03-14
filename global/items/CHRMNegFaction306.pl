sub EVENT_SCALE_CALC {
  my $scale = $client->GetModCharacterFactionLevel(279);
    
  # set the scale based on where faction is in the range [-1500, 0]
  if($scale > 0) {
    $scale = 0;
  }
  $questitem->SetScale($scale/-1500);
}