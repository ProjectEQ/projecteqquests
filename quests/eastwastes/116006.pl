#Oracle of Ry'Gorr for ring 8

sub EVENT_SPAWN {
  quest::settimer(99,2);
}

sub EVENT_TIMER {
  $check = $entity_list->GetMobByNpcTypeID(116577);
  if ($timer == 99 && $check) {
    quest::stoptimer(99);
    quest::settimer(92,1000);
  }
  elsif($timer == 99) {
    quest::stoptimer(99);
  }
  elsif ($timer == 92) {
    quest::depopall(116006);
  }
}