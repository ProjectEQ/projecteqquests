sub EVENT_SCALE_CALC {
  my $money = $client->GetPlatinum();

  if($money < 0) {
    $money = 0;
  }

  $questitem->SetScale($money/64425);
}