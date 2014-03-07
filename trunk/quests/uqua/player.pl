my $counter = 0;
my $RangedItemID = 0;
my $SecondaryItemID = 0;
my $instid = 0;

sub EVENT_ENTERZONE {
	$instid = quest::GetInstanceID('uqua',0);
	if (!defined($qglobals{$instid."_destoff"})) {
		quest::settimer(1,90);
		AURA();
	}
}

sub EVENT_TIMER {
	if (!defined($qglobals{$instid."_destoff"})) {
		AURA();
	} else {
		quest::stoptimer(1);
	}
}

sub EVENT_CLICKDOOR {
	$check_gasnpc1 = $entity_list->GetMobByNpcTypeID(292051);
	$check_gasnpc2 = $entity_list->GetMobByNpcTypeID(292052);
	if ($doorid == 9) {
		if($check_gasnpc1 == 0) {
			quest::forcedooropen(9);
        } elsif (($oncursor{67707} && ($qglobals{$instid."_gaschmb1"} == 1)) || ($oncursor{67708} && ($qglobals{$instid."_gaschmb1"} == 2)) || ($oncursor{67709} && (	$qglobals{$instid."_gaschmb1"} == 3)) || ($oncursor{67710} && ($qglobals{$instid."_gaschmb1"} == 4)) || ($qglobals{$instid."_gaschmb1complete"} == 1)) {
			quest::forcedooropen(9);
			quest::setglobal($instid."_gaschmb1complete",1,3,"H6");
        } else {
			quest::selfcast(5054);
		}
	}
	if (($doorid == 8) && (defined($qglobals{$instid."_gaschmb1"})) && !($check_gasnpc1 == 0)) {
		quest::selfcast(5054);
	}
	if ($doorid == 12) {
		if($check_gasnpc2 == 0) {
			quest::forcedooropen(12);
        } elsif (($oncursor{67707} && ($qglobals{$instid."_gaschmb2"} == 1)) || ($oncursor{67708} && ($qglobals{$instid."_gaschmb2"} == 2)) || ($oncursor{67709} && ($qglobals{$instid."_gaschmb2"} == 3)) || ($oncursor{67710} && ($qglobals{$instid."_gaschmb2"} == 4)) || ($qglobals{$instid."_gaschmb1complete"} == 1)) {
			quest::forcedooropen(12);
			quest::setglobal($instid."_gaschmb2complete",1,3,"H6");
		} else {
			quest::selfcast(5054);
		}
	}
	if (($doorid == 11) && (defined($qglobals{$instid."_gaschmb2"})) && !($check_gasnpc1 == 0)) {
		quest::selfcast(5054);
	}
	if ($doorid == 4) {  #need expedition lockout at this door click until possible 24 hour timer until instance request 
		if(!defined $qglobals{uqualockout}) {
			SET_ZONE_LOCKOUT();
		}
	}
	if ($doorid == 3) {
		if (defined($qglobals{$instid."_uquaragedoor"}) && ($qglobals{$instid."_uquaragedoor"} == 1)) {
			quest::forcedooropen(3);
		}
	}
	if ($doorid == 2) {
		if (defined($qglobals{$instid."_uquafurydoor"}) && ($qglobals{$instid."_uquafurydoor"} == 1)) {
			quest::forcedooropen(2);
		}
	}
}


sub AURA {
	$RangedItemID = $client->GetItemIDAt(14);
	$SecondaryItemID = $client->GetItemIDAt(11);
	if (defined($qglobals{$instid."_destper"})) {
		quest::selfcast(5051);
	} elsif ($RangedItemID == 67736 || $RangedItemID == 67737 || $RangedItemID == 67738 || $RangedItemID == 67739 || $SecondaryItemID == 67736 || $SecondaryItemID == 67737 || $SecondaryItemID == 67738 || $SecondaryItemID == 67739 || $client->FindBuff(756)) {
		$client->Message(15,"You feel protected from the Aura of Destruction.");
	} else {
		quest::selfcast(5051);
	}
}

sub SET_ZONE_LOCKOUT {
	#lockout all players for 24 hours
	foreach $pc ($entity_list->GetClientList()) {
		$pc->SetGlobal('uqualockout',0,3,"H24");
	}
}