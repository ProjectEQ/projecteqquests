sub EVENT_SPAWN {
$drunk = $entity_list->GetMobByNpcTypeID(228111);
 if($drunk == 1){
   quest::settimer("depop",1);
}
 }

sub EVENT_TIMER {
   quest::depop();
}