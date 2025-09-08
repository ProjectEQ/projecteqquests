# File: #Phantasmal_Priest.pl
# ToDo: Some quest text needed
# Items: 60241, 60242

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You seek to move behind this door, yet I cannot allow that until someone with a like mind as me comes forward. Only they will understand the calling and only they can do what is necessary to proceed. If there be anyone who matches my ambitions, step forward to [" . quest::saylink("answer the challenge") . "].");
  }
  elsif ($text=~/challenge/i) {
    if ($class=~/^(Cleric|Druid|Shaman)$/i) {
      $client->Message(0, "You are a priest. It is your ability -- in fact, your very calling -- that requires you to be able to manipulate it. You must sew these together and return to me the product so that I can verify the truth in your words and in your soul.");
      quest::summonitem(60241, 4); # Item: Dried Segment of Flesh x 4
    }
    else {
      $client->Message(0, "You are not of a similar mind as me. You will not understand the hardships. Be gone.");
    }
  }
  elsif ($text=~/north/i) {
    if ($qglobals{$instanceid.ikkymove} && ($qglobals{$instanceid.ikkymove} == 1)) {
      if (!$entity_list->IsMobSpawnedByNpcTypeID(294614)) {
        quest::spawn2(294614,0,0,213,-100,20,0); # NPC: #Trigger_Ikkinz_4
      }
      my $InInstanceIkky7 = quest::GetInstanceID("ikkinz", 6);
      if ($InInstanceIkky7) {
        quest::MovePCInstance(294,$InInstanceIkky7,195,-86,21,0); # Zone: ikkinz
      }
    }
  }
  elsif ($text=~/south/i) {
    if ($qglobals{$instanceid.ikkymove} && ($qglobals{$instanceid.ikkymove} == 1)) {
      if (!$entity_list->IsMobSpawnedByNpcTypeID(294614)) {
        quest::spawn2(294614,0,0,213,-100,20,0); # NPC: #Trigger_Ikkinz_4
      }
      my $InInstanceIkky7 = quest::GetInstanceID("ikkinz", 6);
      if ($InInstanceIkky7) {
        quest::MovePCInstance(294,$InInstanceIkky7,206,-154,20,0); # Zone: ikkinz
      }
    }
  }
}

sub EVENT_ITEM {
  if (quest::handin({60242 => 1})) {
    quest::say("Well done, $name. You have proven you are indeed the priest you claimed to be. This test is not yet over though. As a priest, you must be able to command stone. Before you can command them, you must find that which they lack. You must look to the [" . quest::saylink("north") . "] and to the [" . quest::saylink("south") . "]. Speak return and you shall be back.");
    quest::setglobal($instanceid.ikkymove,1,5,"H6");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::spawn2(294610,0,0,673,-727,-46,380); # NPC: Phantasmal_Priest_Guardian
    quest::spawn2(294610,0,0,670,-700,-46,374); # NPC: Phantasmal_Priest_Guardian
    quest::depopall(294611);
    quest::depop();
  }
}

sub EVENT_SPAWN {
  quest::settimer("locks", 1);
}

sub EVENT_TIMER {
  quest::stoptimer("locks");

  my $door10 = $entity_list->FindDoor(10);
  if ($door10) {
    $door10->SetLockPick(1);
  }
  else {
    quest::debug("Unable to set lockpick on door 10");
  }

  my $door12 = $entity_list->FindDoor(12);
  if ($door12) {
    $door12->SetLockPick(1);
  }
  else {
    quest::debug("Unable to set lockpick on door 12");
  }
}
