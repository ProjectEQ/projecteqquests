sub EVENT_SCALE_CALC {
  my $int = $client->GetINT();
    
  if($int < 0) {
    $int = 0;
  }
  
  $questitem->SetScale($int/300);
}