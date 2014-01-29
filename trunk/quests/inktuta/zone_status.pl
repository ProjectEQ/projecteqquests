#Inktuta Zone_Status NPCID 296070

my $instid = 0;
my $confused_say = 0;
my $rambling_say = 0;
my $incoherent_say = 0;
my $irrational_say = 0; 

sub EVENT_SPAWN {
	#set timer to check for a player to zone in.
	quest::settimer(1,2);
}

sub EVENT_AGGRO {
	$instid = quest::GetInstanceID('inktuta',0); #get the instance id
	#start timer 2 to check the globals now that we have the instance ID
	if($instid > 0) {
		$npc->WipeHateList();
		quest::settimer(2,2);
	} else {
		quest::settimer(1,2);
	}
}

sub EVENT_SIGNAL {
	#stonemite event
	if ($signal == 296033 || $signal == 296030 || $signal == 296035 || $signal == 296036) { #stonemite event
		if($confused_say == 0 && $rambling_say == 0 && $incoherent_say == 0 && $irrational_say == 0) {
			#3 seconds to get all 4 signals
			quest::settimer("stonemite",3);
		}
		if ($signal == 296033) { #confused
			$confused_say = 1;
		} elsif ($signal == 296030) { #rambling
			$rambling_say = 1;
		} elsif ($signal == 296035) { #incoherent
			$incoherent_say = 1;
		} elsif ($signal == 296036) { #irrational
			$irrational_say = 1;
		}
	#Cursecaller win
	} elsif ($signal == 296017) { 
		quest::setglobal($instid.'_inktuta_status',9,3,"H6");
		quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
		$entity_list->FindDoor(42)->SetLockPick(0);
		$entity_list->FindDoor(43)->SetLockPick(0);
		quest::spawn2(296073,0,0,-908,-198,-126,0); #a_pile_of_bones_
		quest::spawn2(296075,0,0,-79,-635,-126,0); #noqufiel_trigger	
	#True_Image win
	} elsif ($signal == 296065) { 
		quest::depopall(296066); #Mirror_Image
		quest::depopall(296074); ##Noqufiel
		quest::depopall(296075); #noqufiel_trigger
		quest::spawn2(296071,0,0,-55, -653, -127, $h); #Jomica_the_Unforgiven
		quest::spawn2(296068,0,0,-127,-652,-127, 121); #bones (loot)
		quest::setglobal($instid.'_inktuta_status',10,3,"H6");
	}
}
	

sub EVENT_TIMER {
	if ($timer == 1) { #begin checking for players
		if ($entity_list->GetClientList()) { #once we find a player
			quest::stoptimer(1);
			#pick any client and "aggro" them so we can get the instance id
			my $rClient = $entity_list->GetRandomClient($x,$y,$z, 1500);
			if ($rClient) {
				quest::attack($rClient->GetName());
			} else {
				#failed to get a client. restart timer 1
				quest::settimer(1,2);
			}
		}
	} elsif($timer == 2) {
		quest::stoptimer(2);
		if(!defined $qglobals{$instid.'_inktuta'}) {
		#if the zone global is not defined boot everyone and destroy the instance.
		KICK_ALL_PLAYERS();
		#destroy the instance 
		quest::DestroyInstance($instid);
		} else {
			if(!defined $qglobals{$instid.'_inktuta_status'}) { #check for their instance global to exist
			quest::targlobal($instid.'_inktuta_status',0,"H6",0,0,296); #create it if it does not.
			#if the global exists begin to check it's values
			} elsif($qglobals{$instid.'_inktuta_status'} == 0) { #0 means nothing done.
				#safety check to make sure the servant is up to trigger kelekdrix, should never actually happen.
				if(!$entity_list->GetMobByNpcTypeID(296023)){ 
				quest::spawn2(296023,0,0,353,-656,-2,194); #Servant_of_Keleldrix
				}
			} elsif($qglobals{$instid.'_inktuta_status'} == 1) { #Kelekdrix spawned
				quest::spawn2(296024,0,0,565,-495,6,0); #Kelekdrix,_Herald_of_Trushar
			} elsif($qglobals{$instid.'_inktuta_status'} == 2) {
				OPEN_DOORS(1);
				quest::spawn2(296027,0,0,165,-496,-27,64); #Mimezpo_the_Oracle
			} elsif($qglobals{$instid.'_inktuta_status'} == 3) {
				OPEN_DOORS(1);
				quest::spawn2(296030,0,0,-274,-531,-52,125); #exiles
				quest::spawn2(296033,0,0,-557,-237,-2,63);
				quest::spawn2(296035,0,0,-385,-562,-76,305);
				quest::spawn2(296036,0,0,-305,-310,-77,190);
			} elsif($qglobals{$instid.'_inktuta_status'} == 4) {
				OPEN_DOORS(2);
			} elsif($qglobals{$instid.'_inktuta_status'} == 5) {
				OPEN_DOORS(2);
				REMOVE_LOOSE_TILES(1);
				quest::spawn2(296048,0,0,-454,-500,-72,192); #a_clay_monolith
				quest::spawn2(296048,0,0,-494,-401,-72,128); #a_clay_monolith
				quest::spawn2(296048,0,0,-533,-500,-72,54); #a_clay_monolith
			} elsif($qglobals{$instid.'_inktuta_status'} == 6) {
				OPEN_DOORS(2);
				REMOVE_LOOSE_TILES(2);
				quest::spawn2(296048,0,0,-533,-580,-97,64); #a_clay_monolith
				quest::spawn2(296048,0,0,-454,-649,-97,192); #a_clay_monolith
				quest::spawn2(296048,0,0,-533,-649,-97,64); #a_clay_monolith
				quest::spawn2(296048,0,0,-454,-580,-97,192); #a_clay_monolith
			} elsif($qglobals{$instid.'_inktuta_status'} == 7) {
				OPEN_DOORS(2);
				REMOVE_LOOSE_TILES(3);
				quest::spawn2(296048,0,0,-533,-737,-122,64); #a_clay_monolith
				quest::spawn2(296048,0,0,-533,-798,-122,64); #a_clay_monolith
				quest::spawn2(296048,0,0,-454,-798,-122,192); #a_clay_monolith
				quest::spawn2(296048,0,0,-454,-737,-122,192); #a_clay_monolith
			} elsif($qglobals{$instid.'_inktuta_status'} == 8) {
				OPEN_DOORS(2);
				REMOVE_LOOSE_TILES(4);
				quest::spawn2(296048,0,0,-371,-953,-122,0); #a_clay_monolith
				quest::spawn2(296048,0,0,-296,-953,-122,0); #a_clay_monolith
				quest::spawn2(296048,0,0,-296,-869,-122,128); #a_clay_monolith
				quest::spawn2(296048,0,0,-371,-869,-122,128); #a_clay_monolith
				quest::spawn2(296052,0,0,-166,-911,-127,194); #Noqufiel
			} elsif($qglobals{$instid.'_inktuta_status'} == 9) {
				OPEN_DOORS(3);
				REMOVE_LOOSE_TILES(4);
				quest::spawn2(296075,0,0,-79,-635,-126,0); #noqufiel_trigger
			} elsif($qglobals{$instid.'_inktuta_status'} == 10) {
				#true image of noqufiel defeated but jomica not talked to.
				OPEN_DOORS(3);
				REMOVE_LOOSE_TILES(4);
				quest::spawn2(296071,0,0,-55, -653, -127, 121); #Jomica_the_Unforgiven
			} elsif($qglobals{$instid.'_inktuta_status'} >= 11) {
				#event completed nothing to restart, but unlock/depop everything that should be down.
				OPEN_DOORS(3);
				REMOVE_LOOSE_TILES(4);
				quest::spawn2(296067,0,0,-63,-600,-127,128);  #an ancient sentinel
			}
		}	
	} elsif ($timer eq "stonemite") {
		if ($confused_say == 1 && $rambling_say == 1 && $incoherent_say == 1 && $irrational_say == 1) {
			#Success
			quest::signalwith(296035,1);  #an_incoherent_exile
			quest::signalwith(296036,1);  #an_irrational_exile
			quest::signalwith(296033,1);  #a_confused_exile
			quest::signalwith(296030,1);  #a_rambling_exile
			quest::ze(15,"The sound of moving gears and grinding stone reverberates throughout the temple. A door has been unlocked.");
			$entity_list->FindDoor(20)->SetLockPick(0);
			quest::setglobal($instid.'_inktuta_status',4,3,"H6");
			quest::spawn2(296073,0,0,-383,-536,-76); #a_pile_of_bones_
			quest::stoptimer("stonemite");
		} else {
			#Stonemite Fail - tell exiles to spawn stonemites
			quest::signalwith(296035,2);  #an_incoherent_exile
			quest::signalwith(296036,2);  #an_irrational_exile
			quest::signalwith(296033,2);  #a_confused_exile
			quest::signalwith(296030,2);  #a_rambling_exile
			quest::stoptimer("stonemite");
			$confused_say = 0;
			$rambling_say = 0;
			$incoherent_say = 0;
			$irrational_say = 0;
		}
	}
}

sub KICK_ALL_PLAYERS {
	#zone all players back to qvic
	my @pc_list = $entity_list->GetClientList();
	foreach $pc ($entity_list->GetClientList()) {
		$pc->MovePC(295, -1014, -1345, -490, 128);
	}
}

sub OPEN_DOORS {
	if($_[0] == 1) {
		$entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
	} elsif($_[0] == 2) {
		$entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
		$entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
	} elsif($_[0] == 3) {
		$entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
		$entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
		$entity_list->FindDoor(42)->SetLockPick(0); #unlock the doors for the Noqufiel event
		$entity_list->FindDoor(43)->SetLockPick(0); #unlock the doors for the Noqufiel event
	}
}

sub REMOVE_LOOSE_TILES {
	if($_[0] == 1) {
		quest::depopall(296020);
		quest::depopall(296002); # a_loose_tile was triggered
	} elsif($_[0] == 2) {
		quest::depopall(296020);
		quest::depopall(296002); # a_loose_tile was triggered
		quest::depop(296045);
		quest::depopall(296049); # a_loose_tile2 was triggered
	} elsif($_[0] == 3) {
		quest::depopall(296020);
		quest::depopall(296002); # a_loose_tile was triggered
		quest::depopall(296045);
		quest::depopall(296049); # a_loose_tile2 was triggered
		quest::depopall(296046);
		quest::depopall(296050); # a_loose_tile3 was triggered
	} elsif($_[0] == 4) {
		quest::depopall(296020);
		quest::depopall(296002); # a_loose_tile was triggered
		quest::depopall(296045);
		quest::depopall(296049); # a_loose_tile2 was triggered
		quest::depopall(296046);
		quest::depopall(296050); # a_loose_tile3 was triggered
		quest::depopall(296047);
		quest::depopall(296051); # a_loose_tile4 was triggered
	}
}