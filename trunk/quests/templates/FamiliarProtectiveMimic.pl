##Protective Mimic, an invisible man familiar from Station Store. In addition to the benefits from the buff (slight overall dmg decrease from opponents) It will...##
##...also mimic your primary weapon graphic once after being summoned. Giving it the appearance of a floating version of your primary weapon##

sub EVENT_SPAWN{
   $OwnerID = $npc->GetOwnerID();
   if($OwnerID <= 0){
      return;
   }
   $Owner = $entity_list->GetClientByID($OwnerID);
   if($Owner){
      $primarygraphic = $Owner->GetEquipmentMaterial(7);
      quest::wearchange(7, $primarygraphic);
   }
}