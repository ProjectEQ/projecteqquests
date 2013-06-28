#win chest was opened.
sub EVENT_DEATH_COMPLETE {
  $instid = quest::GetInstanceID('mirb',50); #get the instance id
  if ($qglobals{$instid.'_mirb_status'} == 5) { #if status is 5 bonus chest not open or not available.
    #check if bonus chest is not up
	if (!$entity_list->GetMobByNpcTypeID(237763)) {
	  #set status to 8 
	  quest::setglobal($instid.'_mirb_status', 8, 7, "H3");
	} else {
	  #if it is up set status to 6
	  quest::setglobal($instid.'_mirb_status', 6, 7, "H3");
	}
  } elsif ($qglobals{$instid.'_mirb_status'} > 5) { #if status is 6+ then looting done.
    #set status to 8 as bonus chest already opened.
	quest::setglobal($instid.'_mirb_status', 8, 7, "H3");
  }
}