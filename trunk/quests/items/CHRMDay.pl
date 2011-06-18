#Only works during the day.

sub EVENT_SCALE_CALC {
  if ($zonetime > 599 && $zonetime < 1900) {
    $questitem->SetScale(1);
  }
  else {
    $questitem->SetScale(0);
  }
}