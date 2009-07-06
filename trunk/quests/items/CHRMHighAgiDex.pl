sub EVENT_SCALE_CALC {
  my $agi = $client->GetAGI();
  my $dex = $client->GetDEX();
    
  if($agi < 0) {
    $agi = 0;
  }

  if($dex < 0) {
    $dex = 0;
  }
  
  my $scale = $agi + $dex;
  
  if($scale < 120) {
  $questitem->SetScale($scale/260);
  }
  
  if($scale > 119 && $scale < 200) {
  $questitem->SetScale($scale/250);
  }
  
  if($scale > 199 && $scale < 300) {
  $questitem->SetScale($scale/240);
  }
  
  if($scale > 299 && $scale < 400) {
  $questitem->SetScale($scale/230);
  }
  
  if($scale > 399 && $scale < 500) {
  $questitem->SetScale($scale/220);
  }
  
  if($scale > 499 && $scale < 600) {
  $questitem->SetScale($scale/210);
  }
  
  if($scale > 599 && $scale < 700) {
  $questitem->SetScale($scale/200);
  }
  
  if($scale > 699 && $scale < 800) {
  $questitem->SetScale($scale/190);
  }
  
  if($scale > 799 && $scale < 900) {
  $questitem->SetScale($scale/180);
  }
  
  if($scale > 899) {
  $questitem->SetScale($scale/170);
  }
}