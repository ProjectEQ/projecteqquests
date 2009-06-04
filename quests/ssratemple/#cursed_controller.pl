#Cursed Event - SsraTemple
#This is the priamry controller for the event. There is two versions of two of the named during the cycle. 
#If a previous raid failed to complete the entire event, but managed to kill some of the named during the event, the next attempt will get lootless palceholders.
#This prevents a group from farming begining NPC's for loot. The PH's have the exact same stats and skills, just no loot. The real version for the first NPC is #a_glyphed_covered_serpent
#and it's lootless PH is #a_rune_covered_serpent. The second NPC's real version is #Vyzh'dra the Exiled with a lootless pH of #Vyzh'Dra the Banished. The final NPC, 
#Vyzh'dra the Cursed has no lootless PH as killing him completes the event for 5 days.
#
# Written by Reno
# 
my $check = 0;
my $variance = int(rand(600));
my $spawntime = 4320 + $variance;

sub EVENT_SPAWN {  
	$check = 0;
	quest::settimer("cursed",60);
}

sub EVENT_TIMER {
$check = 0;
  if($timer eq "cursed") {
    $check_boss = $entity_list->GetMobByNpcTypeID(162270);#cursed_one
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(162271);#cursed_two
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(162272);#cursed_three
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(162273);#cursed_four
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(162274);#cursed_five
    if ($check_boss) {
      $check = 1
    }
    $check_boss = $entity_list->GetMobByNpcTypeID(162275);#cursed_six
    if ($check_boss) {
      $check = 1
    }
	$check_boss = $entity_list->GetMobByNpcTypeID(162276);#cursed_seven
    if ($check_boss) {
      $check = 1
    }
	$check_boss = $entity_list->GetMobByNpcTypeID(162277);#cursed_eight
    if ($check_boss) {
      $check = 1
    }
	$check_boss = $entity_list->GetMobByNpcTypeID(162278);#cursed_nine
    if ($check_boss) {
      $check = 1
    }
	$check_boss = $entity_list->GetMobByNpcTypeID(162279);#cursed_ten
    if ($check_boss) {
      $check = 1
    }
	
    #If one of our NoTarget NPC's is up, we do nothing
    if ($check == 1) {
    } 
	
	#If none of our NoTarget's are up, and the cursed has been recently killed we do nothing
	#This should not be needed but is there for extra protection against spawning outside of desired situation
    if ($check == 0 && defined $qglobals{cursed_dead}) {
    }
	
	#If the event is ready, we begin by spawning our first NPC
    elsif ($check == 0) {
		
		#If the glyph was killed in a previous cycle, and the cursed was not, we spawn a lootless PH
		if (defined $qglobals{glyphed_dead}) {
		
			#Spawn the Rune Covered Serpent. It is a lootless PH for the Glyphed Covered Serpent
			quest::spawn2(162253,0,0,-51,-9,-218.1,63);#runed

        }
		
		#If we should spawn a true Glyphed Serpent, then we will do so
		elsif (!defined $qglobals{glyphed_dead}) {
		
			#Spawn the Glyphed Covered Serpent
			quest::spawn2(162261,0,0,-51,-9,-218.1,63);#glyphed
		}
		
			#stop the timer for checking the NoTarget NPC's so we don't spawn multiples
			quest::stoptimer("cursed");
			
			#Redundant, but for added security
			quest::stoptimer("one");
			
			#Set up a new timer so that we know when the event time limit has been reached
			quest::settimer("one",21600);
    }
  }
	#The event timer has been reached
	if ($timer eq "one" && !defined $qglobals{cursed_dead}) {
	
		#stop our event timer
		quest::stoptimer("one");
		
		#depop any raid NPC's that may be up
		quest::depop(162206);
		quest::depop(162232);
		quest::depop(162214);
		quest::depop(162261);
		quest::depop(162253);
		
		#Depop ourselves to clear it up a bit
		quest::depop();
	}
}      



sub EVENT_SIGNAL {
	#This is a check for the second NPC of the event. The signal comes from the Glyphed, or Rune covered serpents. The signal value is 1.
	
	#If Vyzh'dra the Exiled died during a previous raid, spawna  lootless PH 
	if ($signal == 1 && defined $qglobals{exiled_dead}) {
		
		#Spawn Vyzh'dra the Banished
		quest::spawn2(162214,0,0,-51,-9,-218.1,63);#Vyzh'dra the Banished

    }

	#If Vyzh'dra the Exiled did not die during a previous raid
	elsif ($signal == 1 && !defined $qglobals{exiled_dead}) {

		#Spawn Vyzh'dra the Exiled
		quest::spawn2(162232,0,0,-51,-9,-218.1,63);#Vyzh'dra the Exiled

    }

	#If the Exiled, or Banished has died, it will send a signal value of 2 and we will spawn the final NPC
	if ($signal == 2 && !defined $qglobals{cursed_dead}) {
		
		#Spawn Vyzh'dra the Cursed
		quest::spawn2(162206,0,0,-51,-9,-218.1,63);#Vyzh'dra the Cursed

	}
	
	#This signal verifies that Vyzh'dra the Cursed has died, and we should lockout the event
	if ($signal == 3) {
		
		#set a global to lock out the event for 3 days plus a random variance we generated at spawntime
		quest::setglobal("cursed_dead",1,3,"M$spawntime");

		#stop our event timer
		quest::stoptimer("one");
		
		#Depop ourself to make thing neat for later and clear out any old stuff
		quest::depop();

	}

}