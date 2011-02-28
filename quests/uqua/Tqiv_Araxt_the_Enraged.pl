sub EVENT_SPAWN {
  quest::settimer(5);
}
sub EVENT_TIMER {
  $check_named = $entity_list->GetMobByNpcTypeID(292015);
    quest::spawn2(292077,0,0,-537,-620,-5,2);
    quest::depop();
}