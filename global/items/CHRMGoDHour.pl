#This charm gains power the closer it is until midnight.

sub EVENT_SCALE_CALC {
  $questitem->SetScale((abs($zonehour-12) / 2 * 0.089) + 1);
}