sub EVENT_SCALE_CALC {
  my $scale = $client->GetCHA();

  if($scale < 0) {
    $scale = 0;
  }
  
  if($scale < 60) {
  $questitem->SetScale($scale/260);
  }
  
  if($scale > 59 && $scale < 100) {
  $questitem->SetScale($scale/250);
  }
  
  if($scale > 99 && $scale < 150) {
  $questitem->SetScale($scale/240);
  }
  
  if($scale > 149 && $scale < 200) {
  $questitem->SetScale($scale/230);
  }
  
  if($scale > 199 && $scale < 250) {
  $questitem->SetScale($scale/220);
  }
  
  if($scale > 249 && $scale < 300) {
  $questitem->SetScale($scale/210);
  }
  
  if($scale > 299 && $scale < 350) {
  $questitem->SetScale($scale/200);
  }
  
  if($scale > 349 && $scale < 400) {
  $questitem->SetScale($scale/190);
  }
  
  if($scale > 399 && $scale < 450) {
  $questitem->SetScale($scale/180);
  }
  
  if($scale > 449) {
  $questitem->SetScale($scale/170);
  }
}