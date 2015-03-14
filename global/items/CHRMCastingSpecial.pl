sub EVENT_SCALE_CALC {
  my $abj = $client->GetSkill(4);
  my $alt = $client->GetSkill(5);
  my $con = $client->GetSkill(14);
  my $div = $client->GetSkill(18);
  my $evo = $client->GetSkill(24);
    
  if($abj < 0) {
    $abj = 0;
  }

  if($alt < 0) {
    $alt = 0;
  }
  
  if($con < 0) {
    $con = 0;
  }

  if($div < 0) {
    $div = 0;
  }
  
  if($evo < 0) {
    $evo = 0;
  }
  my $scale = $abj + $alt + $con + $div + $evo;
  
  $questitem->SetScale($scale/1175);
}