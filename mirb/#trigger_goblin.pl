# Zone: mirb
# MOB Name: #trigger_goblin 
# MOB ID Number: 237798
#
my $Goblin_Boss_Dead = 0;

sub EVENT_SPAWN {
  $Goblin_Boss_Dead = 0;
  # Set Range for trap
  my $range = 75;
  # This is the distances that the NPC will trigger on. It is Max X, Max Y, Min X, Min Y
  # use 25 so we get an effective trigger range of 50
  quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

sub EVENT_ENTER {
  START_GOBLIN_EVENT();
  quest::spawn2(237786,0,0,326.00, 1009.00, -53.625, 42.00); # Raid Leader Sig Chol
  quest::spawn2(237785,0,0,713.00, 970.00, 6.25, 71.00); # Taskmaster Suitalp
  #update status global that this event was started
  my $instid = quest::GetInstanceID("mirb",50);
  quest::setglobal($instid.'_mirb_status',1,7,"H3");
}

sub EVENT_TIMER {
  if ($timer eq "SpawnTrash") {
    if ($Goblin_Boss_Dead < 2) {
	  #spawn a_Frostfoot_henchman in one of 4 places.
      my $Goblin_spawn_pointRV = quest::ChooseRandom(1,2,3,4);
      if ($Goblin_spawn_pointRV == 1) {
	    quest::spawn2(237784, 9, 0, 504.62, 906.15, 8.10, 0); # Location 1, grid 9
      } elsif ($Goblin_spawn_pointRV == 2) {
        quest::spawn2(237784, 0, 0, 759.25, 970.71, 9.10, 0); # Location 2 - no grid needed
      } elsif ($Goblin_spawn_pointRV == 3) {
        quest::spawn2(237784, 11, 0, 369.03, 895.31, -52.90, 0); # Location 3, grid 11
      } else {
        quest::spawn2(237784, 10, 0, 721.54, 1469.58, 8.10, 0); # location 4, grid 10
      }
    }
    if(!$entity_list->IsMobSpawnedByNpcTypeID(237785) && !$entity_list->IsMobSpawnedByNpcTypeID(237786)) {
	  #safety check
	  $Goblin_Boss_Dead = 2;
	  DEPOP_ALL();
	}
  }
}

sub EVENT_SIGNAL {
  #Signal 1 is from the two goblin boss NPC's
  if($signal == 1) {
    $Goblin_Boss_Dead++;
    DEPOP_ALL();
  } elsif ($signal == 237774) { #signal from zone_status
    START_GOBLIN_EVENT();
  }
}

sub START_GOBLIN_EVENT {
  # Two named goblins will spawn. Several other goblins will spawn over time until the named are dead
  quest::clear_proximity();
  quest::settimer("SpawnTrash", 15);
}
sub DEPOP_ALL {
  if($Goblin_Boss_Dead >= 2) {
    quest::stoptimer("SpawnTrash");
    quest::depopall(237784); #a_Frostfoot_henchman
	$npc->Depop(0);
  }
}