sub EVENT_DEATH_COMPLETE {
  #send signal to #goblin_trigger(237798) that a boss has died
  quest::signalwith(237798,1,0);
  my $instid = quest::GetInstanceID("mirb",50);
  if ($qglobals{$instid.'_mirb_event'} == 1) {
    #Taskmaster already dead, update zone_status
    quest::setglobal($instid.'_mirb_status',2,7,"H3");
    #reset event global back to 0
    quest::setglobal($instid.'_mirb_event',0,7,"H3");
  } else {
    # set event global to 2
    quest::setglobal($instid.'_mirb_event',2,7,"H3");
  }
}