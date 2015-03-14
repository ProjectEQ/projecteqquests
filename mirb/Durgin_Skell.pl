my $instid = 0;
my $raid;
my $tasks_done = 0;
my $task1 = 0;
my $task2 = 0;
my $task3 = 0;
my $task4 = 0;
my $Laskuth_spawned = 0;

my $slippery_sludge_kill_count=0;
my $icy_bonewalker_spawn=0;

sub EVENT_SPAWN {
  $instid = 0;
  $tasks_done = 0;
  $task1 = 0;
  $task2 = 0;
  $task3 = 0;
  $task4 = 0;
  $Laskuth_spawned = 0;
  # set a proximity range so Durgin can acknowledge a PC and identify the instance ID
  my $range = 2500;
  quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

sub EVENT_ENTER {
  $instid = quest::GetInstanceID('mirb',50); #get the instance id
  quest::clear_proximity();
}

sub EVENT_SAY {
  #Dialogue MIA.  Use filler until it's acquired.
  if ($text=~/hail/i) {
    if ($instid == 0) {
      $instid = quest::GetInstanceID('mirb',50);
    }
    #When hailed, check if all 4 of Durgin's tasks are complete.  Task 4 is a bonus task - 1 for attempting and 2 for success
    if ($task1 >= 1 && $task2 >= 1 && $task3 >= 1 && $task4 >= 1 && $tasks_done == 0) {
      $tasks_done = 1;
    }
    if ($tasks_done && !$Laskuth_spawned) {
      quest::say("Fantastic work, friends. I'm not sure how, but you have accomplished the impossible by ridding the Menagerie of the most horrible abominations imaginable. You've done a great service for the brotherhood. I'm sure Morden will reward you handsomely for . . . Wait, what was that noise?' The caverns tremble and fragments of ice rain down like hail. A deep, thundering roar rumbles from the northeast. 'Oh dear. It sounds like our work is not quite finished. I'll just . . . wait here if you don't mind.");
      quest::spawn2(237797, 0, 0, 216.00, 397.00, -9.75, 128.00); #spawn Laskuth the Colossus
      $Laskuth_spawned = 1;
    } else {
      quest::say("Greetings adventurer, and welcome to this horrid nightmare. In order to fully understand Miragul and escape this horrid place, I ask that you aid me in some [tasks].");
      if ($task1 == 1) {
        quest::say("The sludge no longer blocks the passage ahead.");
      }
      if ($task2 == 1) {
        quest::say("The skeletons no longer haunt my dream. Thank you!");
      }
      if ($task3 == 1) {
        quest::say("The monstrosity of bone is no more.");
      }
      if ($task4 == 2) {
        quest::say("Sharalla rests peacefully.");
      }
    }
  }
  if ($text=~/tasks/i) {
    quest::say("The first task is to dispatch the slime just beyond here. Once completed, proceed to the [second] task.");
  }
  if ($text=~/second/i) {
    quest::say("Some animated skeletons haunt these caverns. The heat of battle is their weakness, but their strength lies in numbers. Destroy all four together so they may not aid each other in their ethereal forms. When this terror is gone, prepare for the [third] task.");
  }
  if ($text=~/third/i) {
    quest::say("An abomination named Marrow the Broken spreads dismay throughout these cold regions. Destroy the vile beast, then I will have one [final] task.");
  }
  if ($text=~/final/i) {
    quest::say("My dear, Sharalla, passed on within these caves. I ask that you only protect her form from the beasts until the nightmare ends.");
  }
}

sub EVENT_SIGNAL {
  if ($instid == 0) {
    #this will not work here. need to do something else if this case happens. though it should not happen.
    #$instid = quest::GetInstanceID('mirb',50); #get the instance id
  }
  #Signal 1 is from the slippery sludges
  if($signal == 1 && $task1 == 0) {
    $slippery_sludge_kill_count++;
    if($slippery_sludge_kill_count >= 16) {
      UPDATE_EVENT(1);
    }
  }
  #Signal 2 is from the chromatic bone walkers
  if ($signal == 2 && $task2 == 0) {
    #signal 2 is sent when an icy bone walker spawns (after the red chromatic bonewalker dies)
    $icy_bonewalker_spawn++;
    # after the first icy bonewalker spawns, you have a short time to spawn all 4 icy bonewalkers before the timer resets.
    if ($icy_bonewalker_spawn==1) {
      quest::settimer("SpawnIcyBoneWalker",30);
    } elsif ($icy_bonewalker_spawn==4) {
      quest::stoptimer("SpawnIcyBoneWalker");
      quest::depopall(237756); # a_chromatic_bonewalker
      quest::depopall(237757); # a_chromatic_bonewalker
      quest::depopall(237791); # a_chromatic_bonewalker
      quest::depopall(237789); # an_icy_bonewalker
      UPDATE_EVENT(2);
    }
  }
  #Signal 3 is from Marrow the Broken
  if ($signal == 3 && $task3 == 0) {
     UPDATE_EVENT(3);
  }
  #Signal 4 is from Sharalla's warder
  #First signal is for spawning event
  #Second signal is for succeeding
  if ($signal == 4) {
    UPDATE_EVENT(4);
  }
  #Signal 5 is from Laskuth the Colossus to spawn chests
  if ($signal == 5) {
    quest::ze(15, "Your victory has shattered the shroud of magic surrounding the dungeon's treasure.");
    quest::setglobal($instid.'_mirb_status', 5, 7, "H3");
    # spawn loot chest
    quest::spawn2(237763, 0, 0, 173, 402, -36, 0);
    # Sharalla's event successful, spawn bonus chest
    if ($task4 > 1) {
      quest::spawn2(237790, 0, 0, 242, 360, -34, 0);
      #will be used by zone_status to know if it needs to respawn a chest or not.
      quest::setglobal($instid.'_mirb_event', 2, 7, "H3");
    } else {
      #will be used by zone_status to know if it needs to respawn a chest or not.
      quest::setglobal($instid.'_mirb_event', 1, 7, "H3");
    }
    #Establish the lockout for the raid
    #there is no $client available here since this is a signal event from an NPC.
    #$raid = $entity_list->GetRaidByClient($client);
    #best we can do here is to hit everyone in the zone.
    foreach $pc ($entity_list->GetClientList()) {
      quest::targlobal("mirb_50_lockout", 1, "D3", 0, $pc->CharacterID(), 0);
    }
  } #end of signal 5
}

sub EVENT_TIMER {
  # if the 4 icy bonewalkers are not spawned within the timer, the kill count must reset, effectively resetting the event.
  if ($timer eq "SpawnIcyBoneWalker") {
    quest::ze(15, "As time draws on, the bonewalkers have regained their strength. Remember, heat is the enemy, but you must act quickly.");
    quest::stoptimer("SpawnIcyBoneWalker");
    $icy_bonewalker_spawn = 0;
  }
}

sub UPDATE_EVENT {
        #  0 - nothing done
#1        #  1 - blob done
#2        #  2 - icy bonewalkers done
#3        #  4 - marrow the broken done
#4        #  8 - Sharalla`s warder hailed (event 4 triggered)
#5        # 16 - Sharalla's corpse protected (event 4 done)
  my $event_status = $qglobals{$instid.'_mirb_event'};
  my $event_to_update = $_[0];
  if ($event_to_update==1) {
    $task1 = 1;
    $event_status+=1;
  } elsif ($event_to_update==2) {
    $task2 = 1;
    $event_status+=2;
  } elsif ($event_to_update==3) {
    $task3 = 1;
    $event_status+=4;
  } elsif ($event_to_update==4) {
    $task4++;
    $event_status+=8; #event 4 can get signaled twice. In that case, adding 8 will effectively turn off the 8 bit and turn on the 16 bit.
  }
  quest::setglobal($instid.'_mirb_event', $event_status, 7, "H3");
  if ($event_status==15) { # events 1, 2, 3 successful, 4 failure
    quest::setglobal($instid.'_mirb_status', 3, 7, "H3");
  } elsif ($event_status==23) { #all events successful
    quest::setglobal($instid.'_mirb_status', 4, 7, "H3");
  }
}