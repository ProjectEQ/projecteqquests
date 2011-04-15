sub EVENT_SPAWN {
  quest::settimer(1,5);
}
sub EVENT_TIMER {
  $check_named = $entity_list->GetMobByNpcTypeID(292015);
  if($check_named == 0) {
    quest::spawn2(292022,0,0,-537,-620,-5,2);
    quest::depop();
    }
}