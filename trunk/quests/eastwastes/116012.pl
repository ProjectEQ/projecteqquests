#Firbrand the black for ring 8

sub EVENT_SPAWN {
  quest::settimer(98,2);
}

sub EVENT_TIMER {
  $check = $entity_list->GetMobByNpcTypeID(116577);
  if ($timer == 98 && $check) {
    quest::stoptimer(98);
    quest::settimer(94,1000);
  }
  elsif($timer == 98) {
    quest::stoptimer(98);
  }
  elsif ($timer == 94) {
    quest::depopall(116012);
  }
}