my $counter = 0;
my $RangedItemID = 0;
my $SecondaryItemID = 0;

sub EVENT_ENTERZONE {
  if (!defined($qglobals{destoff})) {
    quest::settimer(1,90);
    AURA();
  }
}

sub EVENT_TIMER {
  if (!defined($qglobals{destoff})) {
    AURA();
  }
}

sub EVENT_CLICKDOOR {
  $check_gasnpc1 = $entity_list->GetMobByNpcTypeID(292051);
  $check_gasnpc2 = $entity_list->GetMobByNpcTypeID(292052);
  if ($doorid == 9) {
      if($check_gasnpc1 == 0) {
        quest::forcedooropen(9);
        }
      elsif (($oncursor{67707} && ($qglobals{gaschmb1} == 1)) || ($oncursor{67708} && ($qglobals{gaschmb1} == 2)) || ($oncursor{67709} && ($qglobals{gaschmb1} == 3)) || ($oncursor{67710} && ($qglobals{gaschmb1} == 4)) || ($qglobals{gaschmb1complete} == 1)) {
         quest::forcedooropen(9);
         quest::setglobal("gaschmb1complete",1,3,"H6");
         }
    else {
      quest::selfcast(5054);
    }
  }
  if (($doorid == 8) && (defined($qglobals{gaschmb1})) && !($check_gasnpc1 == 0)) {
    quest::selfcast(5054);
  }
  if ($doorid == 12) {
      if($check_gasnpc2 == 0) {
        quest::forcedooropen(12);
        }
    elsif (($oncursor{67707} && ($qglobals{gaschmb2} == 1)) || ($oncursor{67708} && ($qglobals{gaschmb2} == 2)) || ($oncursor{67709} && ($qglobals{gaschmb2} == 3)) || ($oncursor{67710} && ($qglobals{gaschmb2} == 4)) || ($qglobals{gaschmb1complete} == 1)) {
      quest::forcedooropen(12);
      quest::setglobal("gaschmb2complete",1,3,"H6");
    }
    else {
      quest::selfcast(5054);
    }
  }
  if (($doorid == 11) && (defined($qglobals{gaschmb2})) && !($check_gasnpc1 == 0)) {
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
  $RangedItemID = $client->GetItemIDAt(14);
  $SecondaryItemID = $client->GetItemIDAt(11);
  if (defined($qglobals{destper})) {
    quest::selfcast(5051);
  }
  elsif ($RangedItemID == 67736 || $RangedItemID == 67737 || $RangedItemID == 67738 || $RangedItemID == 67739 || $SecondaryItemID == 67736 || $SecondaryItemID == 67737 || $SecondaryItemID == 67738 || $SecondaryItemID == 67739) {
    $client->Message(15,"You feel protected from the Aura of Destruction.");
  }
  else {
    quest::selfcast(5051);
  }
}