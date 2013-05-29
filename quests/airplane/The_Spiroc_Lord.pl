sub EVENT_DEATH {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $sirran= undef;
  if(!defined($qglobals{sirran}) && !$entity_list->GetMobByNpcTypeID(71009)) {
    quest::setglobal("sirran",5,3,"M10");
    quest::spawn(71058,0,0,$x,$y,$z);
  }
  if($entity_list->GetMobByNpcTypeID(71013) || $entity_list->GetMobByNpcTypeID(71009)) {
    quest::updatespawntimer(2630,1000); #The_Spiroc_Lord
  }
}
