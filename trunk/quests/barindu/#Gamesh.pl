#Begin file: barindu/Gamesh.pl
#Probably should check each player in group for active instance rather than just the client.
sub EVENT_SAY {
  my $InstanceActive = (quest::GetInstanceID("snplant",0) || quest::GetInstanceID("sncrematory",0) || quest::GetInstanceID("snpool",0) || quest::GetInstanceID("snlair",0));
  my $group = $entity_list->GetGroupByClient($client);

  if ($text=~/hail/i) {
    quest::say("I don't know why you would want to, but if you want me to tell you the way to one of the different areas of the sewers let me know. I know how to get to the treatment [plant], [crematory], [pools] of sludge, or the [lair] of trapped ones.");
  }
  elsif ($text=~/plant/i) {
    quest::emote("leans in closely to whisper, 'Ok, listen closely...'");
    if ($group) {
      if (!$InstanceActive) {
        my $Instance = quest::CreateInstance("snplant", 0, 10800);
        quest::AssignGroupToInstance($Instance);
        $group->GroupMessage($npc, "You have been assigned to Sewers of Nihilia, Purifying Plant");
      }
      else {
        $client->Message(13, "You are already in an instance!");
      }
    }
    else {
      $client->Message(13, "You are not in a group!");
    }
  }
  elsif ($text=~/crematory/i) {
    quest::emote("leans in closely to whisper, 'Ok, listen closely...'");
    if ($group) {
      if (!$InstanceActive) {
        my $Instance = quest::CreateInstance("sncrematory", 0, 10800);
        quest::AssignGroupToInstance($Instance);
        $group->GroupMessage($npc, "You have been assigned to Sewers of Nihilia, the Crematory");
      }
      else {
        $client->Message(13, "You are already in an instance!");
      }
    }
    else {
      $client->Message(13, "You are not in a group!");
    }
  }
  elsif ($text=~/pools/i) {
    quest::emote("leans in closely to whisper, 'Ok, listen closely...'");
    if ($group) {
      if (!$InstanceActive) {
        my $Instance = quest::CreateInstance("snpool", 0, 10800);
        quest::AssignGroupToInstance($Instance);
        $group->GroupMessage($npc, "You have been assigned to Sewers of Nihilia, Pool of Sludge");
      }
      else {
        $client->Message(13, "You are already in an instance!");
      }
    }
    else {
      $client->Message(13, "You are not in a group!");
    }
  }
  elsif ($text=~/lair/i) {
    quest::emote("leans in closely to whisper, 'Ok, listen closely...'");
    if ($group) {
      if (!$InstanceActive) {
        my $Instance = quest::CreateInstance("snlair", 0, 10800);
        quest::AssignGroupToInstance($Instance);
        $group->GroupMessage($npc, "You have been assigned to Sewers of Nihilia, Lair of Trapped Ones");
      }
      else {
        $client->Message(13, "You are already in an instance!");
      }
    }
    else {
      $client->Message(13, "You are not in a group!");
    }
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#End file: barindu/Gamesh.pl