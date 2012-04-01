sub EVENT_DEATH{
   my $librarian = int(rand(100) + 1);
   if ($librarian <= 10){
      $angrylibr = quest::spawn2(111161,0,0,$x,$y,$z,0);
      $attack = $entity_list->GetMobID($angrylibr);
      $angrylibrattk = $attack->CastToNPC();
      $angrylibrattk->AddToHateList($client, 1);
   }
}

sub EVENT_COMBAT {
	if($combat_state=1) {
		quest::say("Heretic!  Dare you enter our sacred halls?  Your crimes shall not go unpunished.  You shall die for your deeds.");
	}
}

