# Modified from original by Jaekob
# Timers: 1 = check for named mobs to be up, 2 = time for event

sub EVENT_SPAWN {
        quest::spawn_condition($zonesn,1,0);
        quest::spawn_condition($zonesn,2,0);
	quest::settimer(1,30);
	$start_event = undef;
}

sub EVENT_SIGNAL {
	quest::settimer(2,7200);
	quest::ze(1,"The ground rumbles as the Guardian of Doomfire collapses to the ground dead. Then a loud booming voice is heard saying. 'Come little mortals! Feel the chaos of the fires that flame the dark rage. Test yourselves against the might of my armies!'");
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
               quest::spawn_condition($zonesn,1,1);
               quest::ze(1,"Four enraged roars of fury echo from further down the bridge over the cacophany of an army waiting to hand out death. The powerful voice is then heard saying, 'Rexanous, Azobian, Hebabbilys, and Javonn! Come destroy these intruders.'");
               quest::spawn2(217079,0,0,-1325,-1521.6,-202.2,98.9);
               quest::spawn2(217080,0,0,-1283.4,-1568.4,-222.5,95.6);
               quest::spawn2(217077,0,0,-1285.1,-1520.2,-202.2,88.3);
               quest::spawn2(217078,0,0,-1350.4,-1559,-202.2,85.5);
               $start_event = 2;
            }

#phase 3
        elsif ($timer == 1 && $start_event == 2 && $named_up == 0){
                quest::spawn_condition($zonesn,1,0);
		quest::ze(1,"As the last of the army is defeated visions of endless burning flames intrude into your mind. Suddenly the visions ends as a call comes from just ahead saying, 'Prepare to meet your end at the hands of the Council of Fire!'");
                quest::spawn2(217083,0,0,-1459.5,-1150,-197.2,127.6);
                quest::spawn2(217084,0,0,-1545.1,-1147.5,-197.2,130.6);
                quest::spawn2(217082,0,0,-1432.1,-902.2,-185.8,134.80);
                quest::spawn2(217081,0,0,-1578.1,-904.1,-185.8,132.8);
                $start_event = 3;
            }
            
#final phase
	elsif ($timer == 1 && $start_event == 3 && $named_up == 0) {
		quest::stoptimer(1);
		quest::stoptimer(2);
                quest::spawn_condition($zonesn,2,1);
                quest::spawn2(217054,0,0,$x,$y,$z,$h);
		quest::ze(1,"A maddened call of endless fury erupts as a burning creature of pure destructions stands tall before you. The creature then speaks in the loud booming voice of immense power saying, 'You are fools to have come this far. Prepare to tremble at the might of Doomfire!'");
		quest::depop();
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
                quest::spawn_condition($zonesn,1,0);
                quest::spawn_condition($zonesn,2,0);
	}
}

# End of File  Zone: PoFire  ID: 217076  -- #Fennin_Ro_the_Tyrant_of_Fire
# Untargetable
# Zone Emotes added by Covou