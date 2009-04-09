# Controller for the Stone Ring, PoEartha
# Waves of NPC's spawn, progressively harder, and different wuith one fianl named at the end.
# QGlobals used:
# 	stone_ring_run - determines if the event is currently active. Value: 1
#   stone_ring - determines if event has been completed. Doable every 3 days. Value: 1
#	stone_fort - determines if the stone fortifications wave is finished (prevents some wierd looping) Value: 1
#	
#
# Written by: Reno
#

sub EVENT_SPAWN {
   quest::settimer("stone",1); #times the whole thing
   $check=0; #checks for certain NPC's spawns
   $counter=0;
   $countertwo=0;
   $counterthree=0;
   $counterfour=0;
}

sub EVENT_TIMER {
    {
    $check=0;
    }
    if ($timername == "stone" && $stone_ring_run == undef) {
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

    if($check == 0 && $stone_ring == undef && $stone_ring_run == undef) {
		# Here we spawn 50 a_stone_fortification
		# Event moves forward when all are dead
		quest::spawn2(218072,0,0,-705,-170,86.5,125); #a_stone_fortification
		quest::spawn2(218072,0,0,-705,-205,86.5,125);
		quest::spawn2(218072,0,0,-705,-240,86.5,125);
		quest::spawn2(218072,0,0,-705,-275,86.5,125);
		quest::spawn2(218072,0,0,-705,-310,86.5,125);
		quest::spawn2(218072,0,0,-705,-345,86.5,125);
		quest::spawn2(218072,0,0,-618,-170,86.5,125);
		quest::spawn2(218072,0,0,-618,-205,86.5,125);
		quest::spawn2(218072,0,0,-618,-240,86.5,125);
		quest::spawn2(218072,0,0,-618,-275,86.5,125);
		quest::spawn2(218072,0,0,-618,-310,86.5,125);
		quest::spawn2(218072,0,0,-618,-345,86.5,125);
		quest::spawn2(218072,0,0,-580,-170,86.5,125);
		quest::spawn2(218072,0,0,-580,-205,86.5,125);
		quest::spawn2(218072,0,0,-580,-240,86.5,125);
		quest::spawn2(218072,0,0,-580,-275,86.5,125);
		quest::spawn2(218072,0,0,-580,-310,86.5,125);
		quest::spawn2(218072,0,0,-580,-345,86.5,125);
		quest::spawn2(218072,0,0,-678,-170,86.5,125);
		quest::spawn2(218072,0,0,-678,-205,86.5,125);
		quest::spawn2(218072,0,0,-678,-240,86.5,125);
		quest::spawn2(218072,0,0,-678,-275,86.5,125);
		quest::spawn2(218072,0,0,-678,-310,86.5,125);
		quest::spawn2(218072,0,0,-678,-345,86.5,125);
		quest::spawn2(218072,0,0,-705,-170,86.5,125);
		quest::spawn2(218072,0,0,-705,-205,86.5,125);
		quest::spawn2(218072,0,0,-705,-240,86.5,125);
		quest::spawn2(218072,0,0,-705,-275,86.5,125);
		quest::spawn2(218072,0,0,-705,-310,86.5,125);
		quest::spawn2(218072,0,0,-705,-345,86.5,125);
		quest::spawn2(218072,0,0,-618,-170,86.5,125);
		quest::spawn2(218072,0,0,-618,-205,86.5,125);
		quest::spawn2(218072,0,0,-618,-240,86.5,125);
		quest::spawn2(218072,0,0,-618,-275,86.5,125);
		quest::spawn2(218072,0,0,-618,-310,86.5,125);
		quest::spawn2(218072,0,0,-618,-345,86.5,125);
		quest::spawn2(218072,0,0,-580,-170,86.5,125);
		quest::spawn2(218072,0,0,-580,-205,86.5,125);
		quest::spawn2(218072,0,0,-580,-240,86.5,125);
		quest::spawn2(218072,0,0,-580,-275,86.5,125);
		quest::spawn2(218072,0,0,-580,-310,86.5,125);
		quest::spawn2(218072,0,0,-580,-345,86.5,125);
		quest::spawn2(218072,0,0,-678,-170,86.5,125);
		quest::spawn2(218072,0,0,-678,-205,86.5,125);
		quest::spawn2(218072,0,0,-678,-240,86.5,125);
		quest::spawn2(218072,0,0,-678,-275,86.5,125);
		quest::spawn2(218072,0,0,-678,-310,86.5,125);
		quest::spawn2(218072,0,0,-678,-345,86.5,125);
		
		quest::setglobal(stone_ring_run,1,3,"H3"); #Mark that event is now running		
		$counter=0; 
		$countertwo=0;
		$check=0;
		}
	}
}

sub EVENT_SIGNAL {
    if($signal == 1 && $stone_ring == undef && $stone_ring_run == 1 && $stone_fort == undef) { #signal 1 is from stone_fortification
      $check=0; #Make sure it is zero	  
      $check_boss = $entity_list->GetMobByNpcTypeID(218072); #a_stone_fortification
	  
        if ($check_boss) { #don't move forward if they are not all dead
          $check=1; 
        }  

      if($check == 0 && $stone_ring == undef && $stone_ring_run == 1 && $stone_fort == undef) {	  
		#when all fortificatiosn are dead, we spawn the next wave, 4 A_Mound_of_Rubble
        quest::spawn2(218076,0,0,-645,-290,85,30); #Mound_of_Rubble
		quest::spawn2(218076,0,0,-643,-226,85,30);
		quest::spawn2(218076,0,0,-576,-226,85,30);
		quest::spawn2(218076,0,0,-576,-290,85,30);		
        $check=0; #Make sure it is zero
        quest::setglobal(stone_fort,1,3,"H2"); #foritificatiosn are all dead
        }

}

      if($signal == 2) { #signal 2 is from the Mound_of_Rubble's
         $counter += 1;
		 
            if($counter == 4 && $stone_ring == undef && $stone_ring_run == 1 && $stone_fort == 1) {			
				#depop the notarget PH and spawn the real deal
				quest::depop(218029); #A_Rock_Monstrosity
				quest::spawn2(218089,0,0,-612.9,-262.4,89.1,66.5); #A_Rock_Monstrosity
				$counter=0;
				}
      }

	if($signal == 3 && $stone_ring == undef && $stone_ring_run == 1 && $stone_fort == 1) { #Signal 3 is from #A_Rock_Monstrosity (npcid# 218089)	
		# Here we will start the multiple waves of stone heap's
		quest::spawn2(218079,0,0,-579,-299,85,0); #A_Stone_Heap
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

	if($signal == 4 && $stone_ring == undef && $stone_ring_run == 1 && $stone_fort == 1) { #signal 4 is from the 	
        $countertwo += 1; #keeps track of the stone heap waves
		
		#Each one of this is a different wave of Stone_Heap
		#After every 3, a new set will spawn, in the same location as the previous		
		#wave 2
        if($countertwo == 3 && stone_ring == undef) {
		quest::spawn2(218079,0,0,-579,-299,85,0);
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

		#wave 3
	    if($countertwo == 6 && $stone_ring == undef) {
		quest::spawn2(218079,0,0,-579,-299,85,0);
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

		#wave 4
	    if($countertwo == 9 && $stone_ring == undef) {
		quest::spawn2(218079,0,0,-579,-299,85,0);
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

		#wave 5
	    if($countertwo == 12 && $stone_ring == undef) {
		quest::spawn2(218079,0,0,-579,-299,85,0);
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

		#wave 6
	    if($countertwo == 15 && $stone_ring == undef) {
		quest::spawn2(218079,0,0,-579,-299,85,0);
		quest::spawn2(218079,0,0,-579,-200,85,0);
		quest::spawn2(218079,0,0,-678,-266,85,0);
        }

		#After all the Stone_Heap waves we spawn the final NPC, Peregrin_Rockskull
	    if($countertwo == 18 && $stone_ring == undef) {
		quest::spawn2(218049,0,0,-615,-262,88.5,0); #Peregrin_Rockskull
        $counter=0;
        $countertwo=0;
		}
     }

     if($signal == 5) {
       $stone_ring_run=undef; #clear it 
       $stone_fort=undef; #clear it 	   
       quest::setglobal(stone_ring,1,3,"D3"); #prevents doing the event multiple times, also used in the Final Event
       }
}



