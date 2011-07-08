my $instid = 0;

sub EVENT_SPAWN {
  quest::settimer(1,5); #wait 5 seconds after we spawn
}

sub EVENT_TIMER {
  if ($timer == 1) { #begin checking for players
    my @list = $entity_list->GetClientList();
    my $pccount = @list;
    if ($pccount >= 1) { #once we find a player
      quest::stoptimer(1);
	  $instid  = quest::GetInstanceID("inktuta",0); #get their instance id
      if (!defined $qglobals{$instid.'_inktuta_status'}) { #check for their instance global to exist
        quest::targlobal($instid.'_inktuta_status',0,"H6",0,0,296); #create it if it does not.
      #if the global exists begin to check it's values
      } elsif ($qglobals{$instid.'_inktuta_status'} == 0) { #0 means nothing done, nothing to do here.
        #if(!$entity_list->GetMobByNpcTypeID(296023)){ 
          #quest::spawn2(296023,0,0,353,-656,--2,194); #Servant_of_Keleldrix
        #}
      } elsif ($qglobals{$instid.'_inktuta_status'} == 1) { #Kelekdrix spawned
        quest::spawn2(296024,0,0,524,-494,5,189); #Kelekdrix,_Herald_of_Trushar
        quest::spawn2(296025,0,0,357,-549,-3,254); #Watcher_of_Kelekdrix
        quest::spawn2(296026,0,0,357,-451,-2,129); #Usher_of_Kelekdrix
      } elsif ($qglobals{$instid.'_inktuta_status'} == 2) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        quest::spawn2(296027,0,0,165,-496,-27,64); #Mimezpo_the_Oracle
      } elsif ($qglobals{$instid.'_inktuta_status'} == 3) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        quest::spawn2(296030,0,0,-274,-531,-52,125); #a_rambling_exile
        quest::spawn2(296033,0,0,-557,-237,-2,63); #a_confused_exile
        quest::spawn2(296035,0,0,-406,-552,-77,62); #an_incoherent_exile
        quest::spawn2(296036,0,0,-355,-554,-77,190); #an_irrational_exile
      } elsif ($qglobals{$instid.'_inktuta_status'} == 4) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
      } elsif ($qglobals{$instid.'_inktuta_status'} == 5) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        quest::depopall(296002); # a_loose_tile was triggered
        quest::spawn2(296048,0,0,-454,-500,-72,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-494,-401,-72,128); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-500,-72,54); #a_clay_monolith
      } elsif ($qglobals{$instid.'_inktuta_status'} == 6) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::spawn2(296048,0,0,-533,-580,-97,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-649,-97,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-649,-97,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-580,-97,192); #a_clay_monolith
      } elsif ($qglobals{$instid.'_inktuta_status'} == 7) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::depopall(296050); # a_loose_tile3 was triggered
        quest::spawn2(296048,0,0,-533,-737,-122,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-533,-798,-122,64); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-798,-122,192); #a_clay_monolith
        quest::spawn2(296048,0,0,-454,-737,-122,192); #a_clay_monolith
      } elsif ($qglobals{$instid.'_inktuta_status'} == 8) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::depopall(296050); # a_loose_tile3 was triggered
        quest::depopall(296051); # a_loose_tile4 was triggered
        quest::spawn2(296048,0,0,-371,-953,-122,0); #a_clay_monolith
        quest::spawn2(296048,0,0,-296,-953,-122,0); #a_clay_monolith
        quest::spawn2(296048,0,0,-296,-869,-122,128); #a_clay_monolith
        quest::spawn2(296048,0,0,-371,-869,-122,128); #a_clay_monolith
        quest::spawn2(296052,0,0,-166,-911,-127,194); #Noqufiel
      } elsif ($qglobals{$instid.'_inktuta_status'} == 9) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        $entity_list->FindDoor(42)->SetLockPick(0); #unlock the doors for the Noqufiel event
        $entity_list->FindDoor(43)->SetLockPick(0); #unlock the doors for the Noqufiel event
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::depopall(296050); # a_loose_tile3 was triggered
        quest::depopall(296051); # a_loose_tile4 was triggered
        quest::spawn2(296065,0,0,-55,-653,-127,121); #True_Image_of_Noqufiel
        quest::spawn2(296066,0,0,-103,-652,-127,125); #Mirror_Image_of_Noqufiel
      } elsif ($qglobals{$instid.'_inktuta_status'} == 10) {
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        $entity_list->FindDoor(42)->SetLockPick(0); #unlock the doors for the Noqufiel event
        $entity_list->FindDoor(43)->SetLockPick(0); #unlock the doors for the Noqufiel event
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::depopall(296050); # a_loose_tile3 was triggered
        quest::depopall(296051); # a_loose_tile4 was triggered
        quest::spawn2(296071,0,0,$x, $y, $z, $h); #Jomica_the_Unforgiven
      } elsif ($qglobals{$instid.'_inktuta_status'} >= 11) {
        #event completed nothing to restart, but unlock/depop everything that should be down.
        $entity_list->FindDoor(41)->SetLockPick(0); #unlock the first door
        $entity_list->FindDoor(20)->SetLockPick(0); #unock the second door
        $entity_list->FindDoor(42)->SetLockPick(0); #unlock the doors for the Noqufiel event
        $entity_list->FindDoor(43)->SetLockPick(0); #unlock the doors for the Noqufiel event
        quest::depopall(296002); # a_loose_tile was triggered
        quest::depopall(296049); # a_loose_tile2 was triggered
        quest::depopall(296050); # a_loose_tile3 was triggered
        quest::depopall(296051); # a_loose_tile4 was triggered
      }
      quest::depop(); #depop no timer because we always want this mob to spawn at zone start up
    }
  }
}
