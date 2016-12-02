my %whimsy = ();

sub EVENT_ITEM_ENTERZONE {
  $whimsy{$name} = 0; #Initialize player counter
}

sub EVENT_SCALE_CALC {
  if ($whimsy{$name} < 1200) { #120 minutes
    $whimsy{$name}++;
  }
  $questitem->SetScale($whimsy{$name}/1200);
}
