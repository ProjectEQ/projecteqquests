my $NewInstance;
my $ClientNotAdded = 0;
my $raid;

sub EVENT_SAY {
  #need to wrap some of this in a keychain check for the adventure stone i think.
  my $InInstanceMirB = quest::GetInstanceID("mirb",50);
  $ClientNotAdded = 0;
  if ($text=~/hail/i && $client->KeyRingCheck(41000)) {
    quest::say("I am busy building a strategy to take on those oddities deep under the ice here. If you need something, speak up now. I have little time for pleasantries. However, if you can rally the call of your friends perhaps you can help us with a serious [problem].");
    quest::say("Do you need to leave an [instance]?");
  }
  if ($text=~/instance/i) {
    if ($InInstanceMirB > 0) {
      quest::DestroyInstance($InInstanceMirB);
      quest::delglobal($InInstanceMirB.'_mirb_status');
      quest::delglobal($InInstanceMirB.'_mirb_event');
      quest::say("Frozen Nightmare Instance Destroyed");
      $client->ClearCompassMark();
    } else {
      quest::say("You are not assigned the quest Frozen Nightmare.");
    }
  }

  if ($text=~/problem/i && $client->KeyRingCheck(41000)) {
    quest::say("It is terrible that we are losing so many faithful Wayfarers to the chaos of Miragul's Menagerie. As experienced as you are, I hesitate to burden you with this task. It would require you to venture into an extremely dangerous area in the menagerie from which you may not return. I implore you to go deep into an area known as the Frozen Nightmare. It is through there that you would be dropped into the heart of the pandemonium where we have lost our best comrades. I need you to locate and exterminate whatever is killing our people. Are you [interested]?");
  }
  if ($text=~/interested/i && $client->KeyRingCheck(41000)) {
    $raid = $entity_list->GetRaidByClient($client);
    if ($status < 80) {
      if (!$raid) {
        $client->Message(13, "You are not in a raid!");
      } elsif ($raid->RaidCount() < 2) {
        $client->Message(13, "You need at least 6 members in your raid!");
      } elsif ($raid->RaidCount() > 54) {
        $client->Message(13, "You cannot have more than 54 members in your raid!");
      } elsif ($raid->GetLowestLevel() < 61) {
        $client->Message(13, "You have a player below level 61 in your raid!");
      } elsif ($InInstanceMirB!=0) {
        $client->Message(13, "You are already in an instance!");
#      } elsif (defined $qglobals{mirb_50_lockout}) {
#        $client->Message(13, "You have recently completed this raid!");
      } else {
        ASSIGN_RAID_TO_INSTANCE();
      }
    } elsif ($status >= 80) { #this is to let a GM open it and bypass all the checks.
      if (!$raid) {
        $NewInstance = quest::CreateInstance("mirb", 50, 10800);
        quest::AssignToInstance($NewInstance);
        $client->MarkCompassLoc(-5460, -830, 190);
      } else {
        ASSIGN_RAID_TO_INSTANCE();
      }
    }
    if ($NewInstance > 0) {
      quest::say("Keep an eye out for the lost members while you're there, and always be on your toes. Miragul's oddities are as strange as they are deadly. These caves are not called the Frozen Nightmare for nothing.");
      quest::targlobal($NewInstance.'_mirb_status',0,"H3",0,0,0);
      quest::targlobal($NewInstance.'_mirb_event',0,"H3",0,0,0);
    }
    if ($ClientNotAdded > 0) {
      $client->Message(13,$ClientNotAdded.' players were unable to join your expedition.');
    }
  }
}

sub ASSIGN_RAID_TO_INSTANCE {
  $NewInstance = quest::CreateInstance("mirb", 50, 10800);
  for ($count = 0; $count < $raid->RaidCount(); $count++) {
    $temp_client = $raid->GetClientByIndex($count);
    if ($temp_client->KeyRingCheck(41000)) {
      $temp_client->AssignToInstance($NewInstance);
      $temp_client->Message(13, "Added to event: Miragul's Menagerie - The Frozen Nightmare.");
      $temp_client->MarkCompassLoc(-5460, -630, 190);
    } else {
      $ClientNotAdded++;
#      if (defined($qglobals{mirb_50_lockout})) {
#        $temp_client->Message(13,"You have recently completed this expedition, you may not try it again so soon.");
#      } else {
        $temp_client->Message(13,"You cannot enter the expedition without being a member of the Brotherhood.");
#      }
    }
  }
}