sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    if(defined($qglobals{god_kodtaz_access}) && defined($qglobals{god_vxed_access}) && defined($qglobals{god_tipt_access})) {
      if(quest::has_zone_flag(293) != 1) {
  	    quest::set_zone_flag(293);
	  }
    }
  }
}

sub EVENT_ENTERZONE {
#quest::delglobal("druid_epic_natimbi");
  if (defined($qglobals{druid_epic}) && $qglobals{druid_epic}==6 && !defined $qglobals{druid_epic_natimbi}) {
	#quest::setglobal("druid_epic_natimbi",1,3,"H2");
	quest::unique_spawn(280090,0,0,1451.65,957.84,517.86,216); #ritual conduit
  } 
}

sub EVENT_LOOT {
  if ($class eq "Druid" && $looted_id == 62889) {  #Energized Noc Blood
	if (defined($qglobals{druid_epic}) && ($qglobals{druid_epic} > 5)) {
	  if (!defined($qglobals{druid_chest_natimbi})) {
			quest::setglobal("druid_chest_natimbi", "1", 5, "F"); 
			$x = $client->GetX();
			$y = $client->GetY();
			$z = $client->GetZ();
			quest::spawn2(283157,0,0,$x,$y,$z,0);
			return 0;
		}
 
	}
	else 
	{
		return 1;
	}
  }
}