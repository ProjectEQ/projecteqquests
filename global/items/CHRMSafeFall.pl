sub EVENT_SCALE_CALC {
  my $safefall = $client->GetSkill(39);

  if($safefall < 0) {
    $safefall = 0;
  }

  $questitem->SetScale($safefall/330);
}