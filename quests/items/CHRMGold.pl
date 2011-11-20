sub EVENT_SCALE_CALC {
  my $money = $client->GetCarriedMoney();

  if($money < 0) {
    $money = 0;
  }
  if($money > 64425000) {
     $money = 64425000
  }

  $questitem->SetScale($money/64425000);
}