sub EVENT_SCALE_CALC
{
  my $haste = $client->FindType(11);
  
  if($haste) {
    $questitem->SetScale(1);
  }
  else {
    $questitem->SetScale(2);
 }
}