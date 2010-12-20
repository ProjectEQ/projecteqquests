sub EVENT_AGRO {
    quest::settimer(1);
}
sub EVENT_TIMER {
	$votal_up = 0;
$check_named = $entity_list->GetMobByNpcTypeID(284080);
	if ($check_named) {
   	    $votal_up = 1;
        }
}
sub EVENT_DEATH {
  if($votal_up == 1) {
    quest::spawn2(284079,0,0,$x,$y,$z,$h);
  }  
}
