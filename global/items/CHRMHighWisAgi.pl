sub EVENT_SCALE_CALC {
  my $wis = $client->GetWIS();
  my $agi = $client->GetAGI();
    
  if($wis < 0) {
    $wis = 0;
  }

  if($agi < 0) {
    $agi = 0;
  }
  
  my $scale = $wis + $agi;
  
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
  $questitem->SetScale($scale/180);
  }
  
  if($scale > 799 && $scale < 900) {
  $questitem->SetScale($scale/170);
  }

  if($scale > 899) {
  $questitem->SetScale($scale/160);
  }
}