sub EVENT_SCALE_CALC {
  my $money = $client->GetAllMoney();

  if($money < 0) {
    $money = 0;
  }
  if($money > 100000000) {
     $money = 100000000;
  }

  $questitem->SetScale($money/100000000);
}