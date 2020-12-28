sub EVENT_SPAWN {
  $counter = 0;
  $event = 0;
}

sub EVENT_SAY {
  if (($text=~/hail/i) && ($event == 1)) {
    quest::say("Don't bother me until your work is done!");
  }
  if (($text=~/hail/i) && ($event == 2)) {
  quest::emote("tells you, 'I heard the squeal of the massive Kayserops even here.  Excellent work!  I hope that another leader does not rise to take its place any time soon.  You must go back and tell Diru of what has happened here!");
    $group = $entity_list->GetGroupByClient($client);
    if ($group) {
      for ($count = 0; $count < $group->GroupCount(); $count++) {
        if ($group->GetMember($count)) {
          push (@player_list, $group->GetMember($count)->GetName());
        }
      }
    }
    foreach $player (@player_list) {
      $pc = $entity_list->GetClientByName($player);
	  if ($pc) {
        $charid = $pc->CharacterID();
        quest::targlobal("temp_sewers", 1, "F", 283052, $charid, 283);
        $pc->Message(4,"You receive a temporary flag!");
	  }
    }
  }
  if (($text=~/hail/i) && ($event == 0)) {
    quest::emote("tells you, 'Diru sent you yes?  I am so happy you have come to help us.  I have determined that the source of the problem lies in the alpha leader of these stonemites.  It is a large and ancient stonemite that I have named the Kayserops.  I noticed that when together with it they are able to move about more effectively, as if it is able to communicate with them where to go.  Without this alpha leader, I think they would lose this ability and may have a harder time finding their way in to the city.  Find the aged stonemites. I have seen the Kayserops protecting these elders.  Defeating them may draw its attention.");
    quest::spawn2(287021, 0, 0, -96, -1679, -89, 414); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -41, -1685, -89, 422); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 2, -1658, -89, 396); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 18, -1614, -89, 382); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, 5, -1559, -89, 340); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -12, -1517, -89, 318); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -56, -1484, -89, 268); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -53, -1586, -87, 360); # NPC: an_aged_stonemite
    quest::spawn2(287021, 0, 0, -120, -1573, -89, 270); # NPC: an_aged_stonemite
    $event = 1;    
  }
}

sub EVENT_SIGNAL {
  if ($signal == 0) {
    $event = 2;
  }
  if ($signal == 1) { 
    $counter += 1;
  }
  if (($counter == 9) && ($event == 1)) { 
    quest::spawn2(287145, 0, 0, -45, -1616, -87, 380); # NPC: #Ancient_Kayserops
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
