sub EVENT_SCALE_CALC {
  my $poison = $client->GetPR();
  my $disease = $client->GetDR();
  my $magic = $client->GetMR();
  my $fire = $client->GetFR();
  my $cold = $client->GetCR();

  my $scale = $poison + $disease + $magic + $fire + $cold;

  if($scale < 0) {
    $scale = 0;
  }
  
  if($scale > 1430) {
    $scale = 1430;
  }

  $questitem->SetScale($scale/1430);
}