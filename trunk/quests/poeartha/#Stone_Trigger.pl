# Controller for the Stone Ring, PoEartha
# Waves of NPC's spawn, progressively harder, and different wuith one fianl #named at the end.
# QGlobals used:
# 	
#   stone_ring - determines if event has been completed. Doable every 3 days. #Value: 1
#	
#	
#
# Written by: Reno
# Adapted by: Jaekob
# Fixed so ring can't be repeatedly done by: Qazzaz 07/15/10

sub EVENT_SPAWN {
   quest::settimer("stone",61); #times the whole thing
   $check=0; #checks for certain NPC's spawns
   $counter=0;
   $countertwo=0;
   $counterthree=0;
   $counterfour=0;
   quest::spawn_condition($zonesn,2,0); #Make sure we aren't up yet.
}

sub EVENT_TIMER {
    {
    $check=0;
    }

    $check_boss = $entity_list->GetMobByNpcTypeID(218031); #a_crumbling_stone_mass
        if ($check_boss) { #if he is up, don't start event
          $check = 1
       }

    $check_boss = $entity_list->GetMobByNpcTypeID(218032); #a_rock_creation
        if ($check_boss) { #if he is up, don't start event
          $check = 1
        }    

    $check_boss = $entity_list->GetMobByNpcTypeID(218030); #a_pile_of_boulders
        if ($check_boss) { #if he is up, don't start event
          $check = 1
        }

    $check_boss = $entity_list->GetMobByNpcTypeID(218033); #a_boulder_thrower
        if ($check_boss) { #if he is up, don't start event
          $check = 1
        }

   $check_boss = $entity_list->GetMobByNpcTypeID(218072); #a_boulder_thrower
        if ($check_boss) { #if he is up, don't start event
          $check = 1
        }

    if($timer eq "stone" && $check == 0 && !defined $qglobals{stone_ring}) {
		# Here we spawn 50 a_stone_fortification
		# Event moves forward when all are dead
		quest::spawn_condition($zonesn,2,1); #a_stone_fortification
                quest::stoptimer("stone");
		$counter=0; 
		$countertwo=0;
		$check=0;
		}
	else {
		quest::spawn_condition($zonesn,2,0);
	}
}

sub EVENT_SIGNAL {
    if($signal == 1 ) { #signal 1 is from stone_fortification
      $check_boss = $entity_list->GetMobByNpcTypeID(218072); #a_stone_fortification

      if(!$check_boss) {	  
  #when all fortificatiosn are dead, we spawn the next wave, 4 A_Mound_of_Rubble
  		quest::spawn_condition($zonesn,2,0);
        	quest::spawn2(218076,0,0,-645,-290,85,30); #Mound_of_Rubble
		quest::spawn2(218076,0,0,-643,-226,85,30);
		quest::spawn2(218076,0,0,-576,-226,85,30);
		quest::spawn2(218076,0,0,-576,-290,85,30);
        	
        }
}

      if($signal == 2) { #signal 2 is from the Mound_of_Rubble's
         $counter += 1;

            if($counter == 4 ) {			
	#depop the notarget PH and spawn the real deal
	quest::depop(218029); #A_Rock_Monstrosity
	quest::spawn2(218089,0,0,-612.9,-262.4,89.1,66.5); #A_Rock_Monstrosity
	$counter=0;
	}
      }

   if($signal == 3 ) { #Signal 3 is from #A_Rock_Monstrosity (npcid# 218089)	
	# Here we will start the multiple waves of stone heap's
	quest::spawn2(218079,0,0,-579,-299,85,0); #A_Stone_Heap
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }

	if($signal == 4 ) { #signal 4 is from the stone heap	
        $countertwo += 1; #keeps track of the stone heap waves
	#Each one of this is a different wave of Stone_Heap
#After every 3, a new set will spawn, in the same location as the previous		
	#wave 2
        if($countertwo == 3 ) {
	quest::spawn2(218079,0,0,-579,-299,85,0);
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }
	#wave 3
    if($countertwo == 6 ) {
	quest::spawn2(218079,0,0,-579,-299,85,0);
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }
	#wave 4
    if($countertwo == 9 ) {
	quest::spawn2(218079,0,0,-579,-299,85,0);
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }
	#wave 5
    if($countertwo == 12 ) {
	quest::spawn2(218079,0,0,-579,-299,85,0);
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }
	#wave 6
    if($countertwo == 15 ) {
	quest::spawn2(218079,0,0,-579,-299,85,0);
	quest::spawn2(218079,0,0,-579,-200,85,0);
	quest::spawn2(218079,0,0,-678,-266,85,0);
        }
#After all the Stone_Heap waves we spawn the final NPC, Peregrin_Rockskull
    if($countertwo == 18 ) {
	quest::spawn2(218049,0,0,-615,-262,88.5,0); #Peregrin_Rockskull
        $counter=0;
        $countertwo=0;
	}
     }

     if($signal == 5) {
       quest::delglobal("stone_ring");
       quest::setglobal("stone_ring",1,3,"D3");
       quest::setglobal("stone_ring_final",1,3,"D3"); #used in the Final Event
       }

}





