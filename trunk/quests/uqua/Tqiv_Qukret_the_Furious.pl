sub EVENT_SPAWN {
  quest::settimer(1,5);
}
sub EVENT_TIMER {
  $check_named = $entity_list->GetMobByNpcTypeID(292018);
  if($check_named == 0) {
    quest::spawn2(292077,0,0,-1227,-628,-5,0);
    quest::depop();
    }
}