sub EVENT_SCALE_CALC {
  my $alcohol = $client->GetSkill(66);
  my $begging = $client->GetSkill(67);

  if($alcohol < 0) {
    $alcohol = 0;
  }

  if($begging < 0) {
    $begging = 0;
  }

  my $scale = $alcohol + $begging;

  $questitem->SetScale($scale/675);
}