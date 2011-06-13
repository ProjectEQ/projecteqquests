my $counter = 0;

sub EVENT_ENTERZONE {
  if (!defined($qglobals{destoff})) {
    quest::settimer(1,90);
    AURA();
  }
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(2,72);
  }
}

sub EVENT_TIMER {
if ($timer == 1) {
  if (!defined($qglobals{destoff})) {
    AURA();
  }
}
if ($timer == 2) {
$whimsy_count++;
}
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_CLICKDOOR {
  if ($doorid == 9) {
    if (($oncursor{67707} && ($qglobals{gaschmb1} == 1)) || ($oncursor{67708} && ($qglobals{gaschmb1} == 2)) || ($oncursor{67709} && ($qglobals{gaschmb1} == 3)) || ($oncursor{67710} && ($qglobals{gaschmb1} == 4)) || ($qglobals{gaschmb1complete} == 1)) {
      quest::forcedooropen(9);
      quest::setglobal("gaschmb1complete",1,3,"H6");
      quest::depop(292051);
    }
    else {
      quest::selfcast(5054);
    }
  }
  if (($doorid == 8) && (defined($qglobals{gaschmb1})) && !(defined($qglobals{gaschmb1complete}))) {
    quest::selfcast(5054);
  }
  if ($doorid == 12) {
    if (($oncursor{67707} && ($qglobals{gaschmb2} == 1)) || ($oncursor{67708} && ($qglobals{gaschmb2} == 2)) || ($oncursor{67709} && ($qglobals{gaschmb2} == 3)) || ($oncursor{67710} && ($qglobals{gaschmb2} == 4)) || ($qglobals{gaschmb1complete} == 1)) {
      quest::forcedooropen(12);
      quest::setglobal("gaschmb2complete",1,3,"H6");
      quest::depop(292052);
    }
    else {
      quest::selfcast(5054);
    }
  }
  if (($doorid == 11) && (defined($qglobals{gaschmb2})) && !(defined($qglobals{gaschmb2complete}))) {
    quest::selfcast(5054);
  }
  if ($doorid == 4) {  #need expedition lockout at this door click until possible 24 hour timer until instance request 
  $raid = $entity_list->GetRaidByClient($client);
      if ($raid) {
        for ($count = 0; $count < $raid->RaidCount(); $count++) {
          push (@player_list, $raid->GetMember($count)->GetName());
        }
}
foreach $player (@player_list) {
    $pc = $entity_list->GetClientByName($player);
     $charid = $pc->CharacterID();
     quest::targlobal("uqualockout", 1, "H24", 291113, $charid, 291);
  }
}
  if ($doorid == 3) {
    if (defined($qglobals{uquaragedoor}) && ($qglobals{uquaragedoor} == 1)) {
      quest::forcedooropen(3);
    }
  }
  if ($doorid == 2) {
    if (defined($qglobals{uquafurydoor}) && ($qglobals{uquafurydoor} == 1)) {
      quest::forcedooropen(2);
    }
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    $counter += 1;
  }
  if ($counter == 2) {
    if (!defined($qglobals{destper})) {
      quest::stoptimer(1);
      quest::setglobal("destoff",1,3,"H6");
    }
    $client->Message(15,"The Altar of Fury and Altar of Rage hum in harmony. A bright flash of light illuminates the room momentarily, causing the tendrils of murky shadow to dissipate. The Aura of Destruction has faded away.");
    quest::ze(15,"A strange voice shouts, You fools! While you may have stopped the rituals of fury and rage, you are still too late to prevent me from transferring the power of Trushar into our stone guardian. If you wish death, then continue into my chambers!");
  }
}

sub AURA {
  if (defined($qglobals{destper})) {
    quest::selfcast(5051);
    }
  elsif ($hasitem{67736} || $hasitem{67737} || $hasitem{67738} || $hasitem{67739}) {
    $client->Message(15,"You feel protected from the Aura of Destruction.");
  }
  else {
    quest::selfcast(5051);
  }
}
