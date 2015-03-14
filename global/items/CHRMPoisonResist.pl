sub EVENT_SCALE_CALC {
  my $poison = $client->GetPR();
  my $disease = $client->GetDR();

  my $scale = $poison + $disease;

  if($scale < 0) {
    $scale = 0;
  }
  
  if($scale > 575) {
    $scale = 575;
  }

  $questitem->SetScale($scale/575);
}