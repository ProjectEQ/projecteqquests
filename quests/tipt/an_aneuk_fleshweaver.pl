sub EVENT_DEATH_COMPLETE {
  #update zone status
  my $instid = quest::GetInstanceID("tipt",0);
  quest::setglobal($instid.'_tipt_status',8,7,"H6");
}