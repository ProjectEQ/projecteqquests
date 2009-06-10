sub EVENT_SCALE_CALC {
  my $scale = $client->GetCHA();
    
  if($scale < 0) {
    $scale = 0;
  }
  if($scale > 305) {
    $scale = 305;
  }
  $questitem->SetScale($scale/305);
}