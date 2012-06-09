#bonus chest was opened.
sub EVENT_DEATH {
  $instid = quest::GetInstanceID('mirb',50); #get the instance id
  if ($qglobals{$instid.'_mirb_status'} == 5) { #if status is 5 win chest not open yet.
    #set status to 7
    quest::setglobal($instid.'_mirb_status', 7, 7, "H3");
  } elsif ($qglobals{$instid.'_mirb_status'} == 6) { #if status is 6 win chest already open.
    #set status to 8
	quest::setglobal($instid.'_mirb_status', 8, 7, "H3");
  }
}