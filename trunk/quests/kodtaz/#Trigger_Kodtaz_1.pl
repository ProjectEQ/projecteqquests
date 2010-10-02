sub EVENT_SIGNAL {
  if($signal == 0) {
  quest::spawn2(293215,0,0,611,683,-460,32);
  quest::spawn2(293215,0,0,589,771,-459,88);
  quest::spawn2(293215,0,0,673,821,-460,133);
  quest::spawn2(293215,0,0,750,754,-460,180);
  quest::spawn2(293215,0,0,705,668,-453,234);
  quest::spawn2(293216,0,0,581,723,-460,59);
  quest::spawn2(293216,0,0,617,806,-449,103);
  quest::spawn2(293216,0,0,720,803,-460,150);
  quest::spawn2(293216,0,0,744,707,-460,207);
  quest::spawn2(293216,0,0,644,654,-460,7);
  quest::settimer(1,30);
}
  if($signal == 1) {
  quest::spawn2(293217,0,0,611,683,-460,32);
  quest::spawn2(293217,0,0,589,771,-459,88);
  quest::spawn2(293217,0,0,673,821,-460,133);
  quest::spawn2(293217,0,0,750,754,-460,180);
  quest::spawn2(293217,0,0,705,668,-453,234);
  }
  }
sub EVENT_TIMER {
  {
   quest::stoptimer(1);
   quest::settimer(1,3);
      $named_up = 0;
	}
$check_named = $entity_list->GetMobByNpcTypeID(293215);
	if ($check_named) {
		$named_up = 1;
}
if ($timer == 1 && $named_up == 0)  {
   quest::spawn2(293214,0,0,684,719,-460,225);   
   quest::stoptimer(1);
}
}
