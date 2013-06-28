sub EVENT_AGGRO {
  quest::settimer(1,60);
}
sub EVENT_TIMER {
  {
   quest::stoptimer(1);
   quest::settimer(1,3);
      $named_up = 0;
	}
$check_named = $entity_list->GetMobByNpcTypeID(293120);
$check_named = $entity_list->GetMobByNpcTypeID(293213);
	if ($check_named) {
		$named_up = 1;
}
if ($timer == 1 && $named_up == 0)  {
   quest::spawn2(293212,0,0,$x,$y,$z,$h);
   quest::depop_withtimer();
   quest::signalwith(293218,0);
   quest::stoptimer(1);
}
}
sub EVENT_DEATH_COMPLETE {
  quest::spawn2(293211,0,0,$x,$y,$z,$h);
}