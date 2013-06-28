sub EVENT_DEATH_COMPLETE{
   my $librarian = int(rand(100) + 1);
   if ($librarian <= 10){
      $angrylibr = quest::spawn2(111161,0,0,$x,$y,$z,0);
      $attack = $entity_list->GetMobID($angrylibr);
      $angrylibrattk = $attack->CastToNPC();
      $angrylibrattk->AddToHateList($client, 1);
   }
}
