##LoN Scykin Familiar that periodically casts a group shrink##


sub EVENT_SPAWN{
   $ClientID = $npc->GetOwnerID();
   if($ClientID > 0){
      $c = $entity_list->GetClientByID($ClientID);
      if($c){
         $c->CastSpell(3393, $ClientID, 10, 0); ##Tiny Terror##
         quest::settimer("ShrinkTime", 60);
      }
   }
}

sub EVENT_TIMER{
   if($timer eq "ShrinkTime"){
      $c->CastSpell(3393, $ClientID, 10, 0);
      quest::stoptimer("ShrinkTime");
      quest::settimer("ShrinkTime", 60);
   }
}