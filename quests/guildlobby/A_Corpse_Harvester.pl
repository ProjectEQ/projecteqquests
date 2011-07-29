sub EVENT_SAY {
  my $CorpseCount = 0;
  my $charid = $client->CharacterID();
  if($text=~/hail/i) {
    $client->Message(15,"I can [bury a corpse] or [destroy a corpse] that you have unburied.");
  } else {
    $CorpseCount = COUNT_CORPSES();
    if($text eq "destroy a corpse") {
      if($CorpseCount == 1) {
        $client->Message(15,'You have '.$CorpseCount.' corpse in the zone, are you certain you wish to [destroy this corpse]? Be very certain that you have the correct corpse unburied. A GM WILL NOT be able to undo this action. If not, I can [bury the corpse] for you.');
        quest::setglobal("dest_corpse",1,0,"M2");
      } elsif($CorpseCount > 1) {
        $client->Message(15,'You have '.$CorpseCount.' corpses in the zone and I am unabled to read your mind to know which one to destroy. Would you like to [bury a corpse] instead?');
      } else {
        $client->Message(13,"You have no unburied corpses, begone.");
      }
    }
    if($text eq "bury a corpse" || $text eq "bury the corpse") {
	  if($CorpseCount > 0) {
        quest::buryplayercorpse($charid);
        $client->Message(15,"Very well, burying one of your corpses now.");
      } else {
        $client->Message(13,"You have no unburied corpses, begone.");
	  }
    }
    if(defined($qglobals{dest_corpse}) && $qglobals{dest_corpse} == 1 && $text eq "destroy this corpse" && $CorpseCount == 1) {
      my $response = int(rand(1000)) + 1000;
      quest::setglobal("dest_corpse",$response,0,"M2");
      $client->Message(14,'To confirm you really wish to destroy this corpse, please say ['.$response.'].');
	  quest::popup('Destroy your corpse', 'Are you absolutely certain you wish to destroy your corpse?<br /><br />If you are then /say '.$response.' to the Corpse Harvester.<br /><br /><b>THIS CAN NOT BE UNDONE BY A GM. ONCE DESTROYED, NOTHING CAN BRING BACK THIS CORPSE!</b>', 666, 0, 0);
    }
    if(defined($qglobals{dest_corpse}) && $qglobals{dest_corpse} == $text && $CorpseCount == 1) {
      $client->Message(15,"Confirmed, I am now destroying your corpse.");
      my $corpse = $entity_list->GetCorpseByOwner($client);
      $client->Message(0,'You have served your purpose '.$corpse->GetOwnerName().'\'s corpse, now begone');
      $corpse->Delete();
      $client->Message(15,"Your corpse has been destroyed beyond any means of recovery.");
      quest::delglobal(dest_corpse);
    }
  }
}

sub COUNT_CORPSES {
  my @corpse_list = $entity_list->GetCorpseList();
  my $count = 0;
  foreach $corpse_found (@corpse_list) {
    if ($corpse_found->GetOwnerName() eq $client->GetName()) {
      $count++;
    }
  }
  $count;
}