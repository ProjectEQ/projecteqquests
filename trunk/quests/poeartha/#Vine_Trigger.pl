#Vine Ring
#
# QGlobals used:
# 	vine_ring_run - Event is in progress and cannot begin a secong time. Value: 1
#	vine_ring - Event has been completed and cannot be done again. Used for the final event also. Value: 1
#
#
# Written by: Reno

sub EVENT_SPAWN {
quest::settimer("vine",62);
$counter=0;
}

sub EVENT_TIMER {
    {
    $check=0;
    }

    if ($timer eq "vine") {
    $check_boss = $entity_list->GetMobByNpcTypeID(218019); #A_Tainted_Rock_Beast 
        if ($check_boss) {
          $check = 1
        }

        if ($check == 0 && !defined $qglobals{vine_ring} && !defined $qglobals{vine_ring_run}) { #When no more A_Tainted_Rock_Beast are up, spawn the A_Bloodthirsty_Vegerog 
			quest::spawn2(218040,0,0,483,-781,43.5,0); #A_Bloodthirsty_Vegerog 
			quest::spawn2(218040,0,0,434,-832,43.5,192);
			quest::spawn2(218040,0,0,483,-883,43.5,128);
			quest::spawn2(218040,0,0,533,-832,43.5,64);
			quest::spawn2(218040,0,0,533,-911,41.5,128);
			quest::spawn2(218040,0,0,434,-911,41.5,128);
			quest::spawn2(218040,0,0,533,-751,41.5,0);
			quest::spawn2(218040,0,0,431,-751,43.5,0);
			quest::spawn2(218040,0,0,482,-950,37.5,0);
			quest::spawn2(218040,0,0,485,-714,37.5,0);
            $counter=0;
            $check=0;
            quest::setglobal("vine_ring_run",1,3,"H3"); #Event is started
		}      
	}
}

sub EVENT_SIGNAL {
	if($signal == 1) { #signal 1 is from the A_Bloodthirsty_Vegerog 
		$counter += 1;
	
		if($counter == 10 && !defined $qglobals{vine_ring} && defined $qglobals{vine_ring_run}) {
			quest::spawn2(218058,0,0,485,-835,30,0);
			$counter=0;
		}
	}

	if($signal == 3 && !defined $qglobals{vine_ring} && defined $qglobals{vine_ring_run}) { #signal 3 is from Derugoak_Bloodwalker 
		quest::delglobal("vine_ring");
		quest::delglobal("vine_ring_run");
		quest::setglobal("vine_ring",1,3,"D3"); #Event is over
	}
}