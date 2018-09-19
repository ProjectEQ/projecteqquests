my $questclient;
my $PetEnt;

sub EVENT_SPAWN {
  quest::set_proximity($x-50,$x+50,$y-50,$y+50);
}

sub EVENT_ENTER {
	my $charmitem = $client->GetItemIDAt(quest::getinventoryslotid("charm"));
	if ($charmitem==62815) {
		if ($client->GetPetID()) {
		my $PetID = $client->GetPetID();
		$PetEnt = $entity_list->GetMobByID($PetID);
		my $PetName = $PetEnt->GetCleanName();
			if ( $PetName == "a swamp aligator") {
				$questclient=$name;
				$client->Message(15, "Not safe!");
				quest::settimer(1,5);
				#$client->Message(15, "Must go now!");
				#$client->Message(15, "You sense your alligator ally panic. He thrashes about in conflict, his desire to aid you conflicting with a tremendous fear. Seconds later the creature dies from the shock.");
				#$client->Message(15, "Muck and slime are flung from the beasts tentacles as it swings them wildly in anger at being disturbed");
				#$PetEnt->Depop(1);
				#quest::spawn2(47208,0,0,-93,-442,-82,0); #spawn #Swamp_Terror
				#quest::depop_withtimer();
			}			
		}
	}	
}

sub EVENT_TIMER {  
  if ($timer == 1) {
	quest::stoptimer(1);
	$entity_list->GetClientByName("$questclient")->Message(15, "Must go now!");
	quest::settimer(2,5);
  }
  if ($timer == 2) {
	quest::stoptimer(2);
	$entity_list->GetClientByName("$questclient")->Message(15, "You sense your alligator ally panic. He thrashes about in conflict, his desire to aid you conflicting with a tremendous fear. Seconds later the creature dies from the shock.");
	quest::settimer(3,5);
  }
  if ($timer == 3) {
	quest::stoptimer(3);
	$entity_list->GetClientByName("$questclient")->Message(15, "Muck and slime are flung from the beasts tentacles as it swings them wildly in anger at being disturbed");
	$PetEnt->Depop(1);
	quest::spawn2(47208,0,0,-93,-442,-82,0); #spawn #Swamp_Terror
	quest::depop_withtimer();
  }   
}