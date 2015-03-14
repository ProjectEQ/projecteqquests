sub EVENT_CLICKDOOR {
  if($doorid == 1) {
    if(defined($qglobals{god_kodtaz_access}) && defined($qglobals{god_vxed_access}) && defined($qglobals{god_tipt_access})) {
      if(quest::has_zone_flag(293) != 1) {
  	    quest::set_zone_flag(293);
	  }
    }
  }
}