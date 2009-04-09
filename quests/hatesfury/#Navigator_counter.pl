sub EVENT_SPAWN {
    $counter = 0;
}

sub EVENT_SIGNAL {
  if ($signal == 23) {
    $counter += 1;
}
  if ($counter == 12) { #spawn Navigator
    quest::spawn2(228110,0,0,1542,982,-582,125);
    quest::depop();
    $counter = 0;
}
 }