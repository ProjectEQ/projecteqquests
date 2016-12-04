#This charm gains power the closer it is until midnight.
#midnight and noon seem to not fit the formula

sub EVENT_SCALE_CALC {
  if ($zonehour == 0) {
    $questitem->SetScale(1.55);
  } elsif ($zonehour == 12) {
    $questitem->SetScale(0.85);
  } else {
    $questitem->SetScale((150 - (5 * (12 - abs(12 - $zonehour)))) / 100.0);
  }
}
