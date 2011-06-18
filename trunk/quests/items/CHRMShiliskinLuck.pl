#This item waxes and wanes in power at its own whim.

sub EVENT_SCALE_CALC {
  my $scale = int(rand(10)) + 1;

  $questitem->SetScale($scale/10);
} 