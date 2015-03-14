sub EVENT_SCALE_CALC {
  my $weight = $client->GetWeight();

  if($weight < 35) {
    $weight = 35;
  }
  $questitem->SetScale(35/$weight);
}