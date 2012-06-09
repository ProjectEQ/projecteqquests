sub EVENT_DEATH {
  #send signal to #goblin_trigger(237798) that a boss has died
  quest::signalwith(237798,1,1);
  my $instid = quest::GetInstanceID("mirb",50);
  if ($qglobals{$instid.'_mirb_event'} == 2) {
    #Raid Leader already dead, update zone_status
    quest::setglobal($instid.'_mirb_status',2,7,"H3");
    #reset event global back to 0
    quest::setglobal($instid.'_mirb_event',0,7,"H3");
  } else {
    # set event global to 1
    quest::setglobal($instid.'_mirb_event',1,7,"H3");
  }
}