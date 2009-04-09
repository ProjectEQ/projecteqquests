sub EVENT_SPAWN {
    $drunk = 0;
}

sub EVENT_SIGNAL {
$drunkup = $entity_list->GetMobByNpcTypeID(228111);
  if ($signal == 33) {
    $drunk += 1;
}
  if ($drunk == 23 && !$drunkup) { #spawn the drunken buccaneer
    quest::spawn2(228111,0,0,431,1006,-607.4,0);
    $drunk = 0;
    quest::depop();
}
  elsif ($drunk == 23 && $drunkup) {
    $drunk = 0;
}
 }