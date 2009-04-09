# Modified from original by Jaekob
# Timers: 1 = check for named mobs to be up, 2 = time for event

sub EVENT_SPAWN {
	quest::settimer(1,5);
	$start_event = undef;
}

sub EVENT_SIGNAL {
	quest::settimer(2,7200);
	$start_event = 1;
}

sub EVENT_TIMER {
	{
		quest::stoptimer(1);
		quest::settimer(1,5);
		$named_up = 0;
	}
$check_named = $entity_list->GetMobByNpcTypeID(217102);
		if ($check_named) {
			$named_up = 1;
}

$check_named = $entity_list->GetMobByNpcTypeID(217103);
		if ($check_named) {
			$named_up = 1;
}
$check_named = $entity_list->GetMobByNpcTypeID(217101);
		if ($check_named) {
			$named_up = 1;
}
$check_named = $entity_list->GetMobByNpcTypeID(217100);
		if ($check_named) {
			$named_up = 1;
}
$check_named = $entity_list->GetMobByNpcTypeID(217087);
		if ($check_named) {
			$named_up = 1;
}
$check_named = $entity_list->GetMobByNpcTypeID(217088);
		if ($check_named) {
			$named_up = 1;
}



	
	$check_named = $entity_list->GetMobByNpcTypeID(217077);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217078);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217079);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217080);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217081);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217082);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217083);
		if ($check_named) {
			$named_up = 1;
		}

	$check_named = $entity_list->GetMobByNpcTypeID(217084);
		if ($check_named) {
			$named_up = 1;
		}
#phase 2
       if ($timer == 1 && $start_event == 1 && $named_up == 0)  {
               quest::spawn2(217101,0,0,-1268.2,-1603.9,-231.5,84.8);
               quest::spawn2(217101,0,0,-1226.4,-1579.0,-231.5,87.1);
               quest::spawn2(217101,0,0,-1220.2,-1549.4,-231.5,113.7);
               quest::spawn2(217101,0,0,-1242,-1565.3,-231.5,87.5);
               quest::spawn2(217101,0,0,-1260,-1579.3,-231.5,86.8);
               quest::spawn2(217101,0,0,-1288.3,-1597.3,-231.5,82.8);
               quest::spawn2(217101,0,0,-1310.8,-1615.8,-231.5,67.6);
               quest::spawn2(217102,0,0,-1253.2,-1548,-222.5,80.3);
               quest::spawn2(217102,0,0,-1313.9,-1593.6,-222.5,80.3);
               quest::spawn2(217102,0,0,-1332.8,-1589.4,-213.5,80.3);
               quest::spawn2(217102,0,0,-1253.2,-1534.7,-213.5,80.3);
               quest::spawn2(217103,0,0,-1278.3,-1570.5,-225.5,88.1);
               quest::spawn2(217103,0,0,-1346.3,-1576.6,-204.5,88.1);
               quest::spawn2(217103,0,0,-1261,-1512.2,-204.5,96.1);
               quest::spawn2(217103,0,0,-1310.5,-1535.3,-202.2,89.5);
               quest::spawn2(217103,0,0,-1293.7,-1554.8,-210.5,101.1);
               quest::spawn2(217079,0,0,-1325,-1521.6,-202.2,98.9);
               quest::spawn2(217080,0,0,-1283.4,-1568.4,-222.5,95.6);
               quest::spawn2(217077,0,0,-1285.1,-1520.2,-202.2,88.3);
               quest::spawn2(217078,0,0,-1350.4,-1559,-202.2,85.5);
               $start_event = 2;
            }

#phase 3
        if ($timer == 1 && $start_event == 2 && $named_up == 0){
                quest::spawn2(217083,0,0,-1459.5,-1150,-197.2,127.6);
                quest::spawn2(217084,0,0,-1545.1,-1147.5,-197.2,130.6);
                quest::spawn2(217082,0,0,-1432.1,-902.2,-185.8,134.80);
                quest::spawn2(217081,0,0,-1578.1,-904.1,-185.8,132.8);
                $start_event = 3;
            }
            
#final phase
	if ($timer == 1 && $start_event == 3 && $named_up == 0) {
		quest::stoptimer(1);
		quest::stoptimer(2);
                quest::spawn2(217053,0,0,-1364,-1533,-190.8,1832);
                quest::spawn2(217053,0,0,-1390,-1475,-190.8,1836);
                quest::spawn2(217053,0,0,-1419,-1436,-190.8,1836);
                quest::spawn2(217053,0,0,-1372,-1400,-190.8,1836);
                quest::spawn2(217053,0,0,-1336,-1434,-190.8,1836);
                quest::spawn2(217053,0,0,-1295,-1486,-190.8,1816);
                quest::spawn2(217053,0,0,-1410,-974,-185.8,1024);
                quest::spawn2(217053,0,0,-1576,-974,-185.8,1024);
                quest::spawn2(217053,0,0,-1690,-1060,-154.6,512);
                quest::spawn2(217053,0,0,-1313,-1064,-154.6,1536);
                quest::spawn2(217054,0,0,$x,$y,$z,$h);
		quest::depop;
	}

#depop after time expires
	if ($timer == 2) {
		quest::stoptimer(2);
		$start_event = undef;
                quest::signal(217077,0);
                quest::signal(217084,0);
                quest::signal(217083,0);
                quest::signal(217078,0);
                quest::signal(217079,0);
                quest::signal(217082,0);
                quest::signal(217080,0);
                quest::signal(217081,0);
                quest::depopall(217102);
                quest::depopall(217103);
                quest::depopall(217101);
                quest::depopall(217100);
                quest::depopall(217087);
                quest::depopall(217088);
	}
}

# End of File  Zone: PoFire  ID: 217076  -- #Fennin_Ro_the_Tyrant_of_Fire
# Untargetable