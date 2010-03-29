##Event_Execution_Control.pl
#Trial of Execution
#Modified from Wiz's version by Kilelen

#########################################################################################################################################
#   
#   Modified by greenbean 03/23/2010
#   
#   Notes:
#   Group is teleported to trial area
#   A maximum of 6 players are put on 'allow' list
#   Those on list may return to trial area as long as 1 person remains in area (ex. LD or death)
#   Anyone not on 'allow' list is ejected
#   Wave 1 begins after 30s Prep Time
#   Wave 2 begins 170s after wave 1 started
#   Wave 3 begins 165s after wave 2 started
#   Wave 4 begins 160s after wave 3 started
#   Killing faster results in more time to rest between waves
#   Time until Executioner kills prisoner:
#   wave1: 34s
#   wave2: 33s
#   wave3: 32s
#   wave4: 30s
#   Boss spawns on stage immediately after killing the final mob of wave 4
#   When trial is over, players have 15m to leave the trial area or be ejected
#   After killing the boss the trial locks for 20m after the last person leaves trial area. (max 35m wait depending when players exit)
#   On failure the trial is available immediately after the last person leaves trial area.
#   When area is clear players corpses move to graveyard (optional) and mob corpses are deleted.
#
##########################################################################################################################################

my $allow_entry = 0;   
my @trial_group = ();       #who is currently in the trial
my @allowed = ();       #who is allowed back in trial (for LD, death, etc)
my $spawn_ex = 1;
my $wave = 1;
my $move_client_corpses = 1;    #Set to 0 to not move client corpses out of trial area when clear
my $proximity_check_delay = 30; #handle proximity check speed - faster only during trial
my $mob_count = 0;      #keep track of trial mobs to handle resetting executioner
my @mob_ids = ();      #for deleting mob corpses on exit
my @trial_mobs = ("priest of doom", "Herald of Destruction", "a dark nemesis", "a fierce nemesis");

sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   $npc->ChangeSize(1, 1);
   quest::settimer("proximity_check",$proximity_check_delay);
   quest::settimer("clear_corpses", 60);
}

sub EVENT_SIGNAL {

   if ($signal == 0) {
      quest::depop();
   }

   elsif ($signal == 1) {
      quest::stoptimer("clear_corpses");
      quest::stoptimer("trial_eject");
      $proximity_check_delay = 1; #speed up during trial
      quest::settimer("proximity_check",$proximity_check_delay);
      #Allow new members to join trial
      $allow_entry = 1;
      quest::settimer("trial_lock", 6);
      $wave = 1;
      $spawn_ex = 1;
      #Set wave timers
      quest::settimer("execution_wave1", 30);                
      quest::settimer("execution_wave2", 200);   
      quest::settimer("execution_wave3", 365);   
      quest::settimer("execution_wave4", 525);                   
      #Spawn the prisoner
      quest::spawn2(201424, 0, 0, 165, -1156, 80, 61);      
   }
   
   elsif ($signal == 2) {
      #It's over, one way or another.
      $mob_check = undef;
      #Timer to eject everyone after 15 minutes
      quest::settimer("trial_eject", 900);
      quest::stoptimer("execution_wave1");
      quest::stoptimer("execution_wave2");
      quest::stoptimer("execution_wave3");
      quest::stoptimer("execution_wave4");
      #Despawn executioner
      quest::signalwith(201439, 5, 5);
      #Despawn prisoner
      quest::signalwith(201424, 0, 5);
      #Depawn trial trash
      quest::signalwith(201427, 0, 5);
      quest::signalwith(201428, 0, 5);
      quest::signalwith(201429, 0, 5);
      quest::signalwith(201430, 0, 5);
      quest::signalwith(201431, 0, 5);
      quest::signalwith(201432, 0, 5);
      #Despawn the boss if he's up
      quest::signalwith(201433, 0, 5);
   }
   elsif ($signal == 3) {
      #fail message
      foreach $player (@trial_group) {
         $c = $entity_list->GetClientByName($player);
         $c->Message(0, "The prisoners cry is cut off as his body crumples to the ground. You have failed.");
      }
      quest::ze(15, "An unnatural silence falls around you. The justice of the Tribunal has been pronounced once again. The defendants have been found...lacking.");
      #Signal self that it's over
      quest::signalwith(201425, 2, 5);
   }
}

sub EVENT_TIMER {
   if ($timer eq "proximity_check") {
      quest::stoptimer("proximity_check");
      
      if ( defined $mob_check ) {
         #Count mobs
         my $found = 0;
         my @moblist = $entity_list->GetMobList();
         foreach $tempmob (@moblist) {
            my $mobname = $tempmob->GetCleanName();
            @m = grep(/^$mobname$/, @trial_mobs);
            $matched = @m;
            if ( $matched ) {
               $found++;
               $mob_id = $tempmob->GetID();
               @m_id = grep(/^$mob_id$/, @mob_ids);
               $found_id = @m_id;
               if (!$found_id) {
                  push(@mob_ids, $mob_id);
               }
            }
         }

         if (!$found) {
            #Set an executioner to repop on Next wave.
            $spawn_ex = 1;
            $wave++;
            if ($wave < 5) {
               #Depop Executioner
               quest::signalwith(201439, 5, 0);
               $mob_check = undef;
            }
            else {
               #Depop Executioner
               quest::signalwith(201439, 5, 0);
               #Prime_Executioner_Vathoch (201433)
               quest::spawn2(201433,0,0,196,-1156,80.1,0);
               $mob_check = undef;
               $boss = 1;
            }
         }
         elsif ( $found < $mob_count ) {
            $mob_count = $found;
            #Reset the Executioner
            quest::signalwith(201439, 0, 0);
         }
      }
      elsif (defined $boss){
         my @moblist = $entity_list->GetMobList();
         foreach $tempmob (@moblist) {
            my $mobname = $tempmob->GetCleanName();
            if ( $mobname eq "Prime Executioner Vathoch" ) {
               $mob_id = $tempmob->GetID();
               push(@mob_ids, $mob_id);
               $boss = undef;
            }
         }
      }
      
      my @clientlist = $entity_list->GetClientList();
      $removed = 0;
      foreach $ent (@clientlist) {
         my $ClientName = $ent->GetName();
         @m = grep(/^$ClientName$/, @allowed);
         $in_allowed = @m;
         @m = grep(/^$ClientName$/, @trial_group);
         $in_trial = @m;
         $size = @trial_group;
         
         #Check if they are in the trial area
         if ( $ent->CalculateDistance(194, -1120, 72) < 120 ) {
            if (!$in_allowed) {
               if ($allow_entry && $size < 6) {
                  push(@allowed, $ClientName);
               }
               else {
                  $ent->Message(15, 'You are not a part of this trial.');
                  $ent->MovePC(201,456,825,9,1);
               }
            }
            
            if (!$in_trial) {
               if ( ($allow_entry || $in_allowed) && $size < 6 ) {
                  push(@trial_group, $ClientName);
               }
            }
         }
         #See if they left trial
         else {
            if ($in_trial) {
               #$size = @trial_group;
               for ($i = 0; $i < $size; $i++) {
                  if ($trial_group[$i] eq $ClientName ) {
                     $removed++;
                     splice(@trial_group, $i, 1);
                     last;
                  }
               }
            }
         }
      
      }
      
      #Is everyone gone?
      if ($removed) {
         $size = @trial_group;
         if (!$size) {
            #Check for Boss
            $found = 0;
            my @moblist = $entity_list->GetMobList();
            foreach $tempmob (@moblist) {
               my $mobname = $tempmob->GetCleanName();
               if ( $mobname eq "Prime Executioner Vathoch" ) {
                  $found++;
                  last;
               }
            }

            if ($found) {
               #Boss up when everyone exits - announce fail
               quest::ze(15, "An unnatural silence falls around you. The justice of the Tribunal has been pronounced once again. The defendants have been found...lacking.");
            }   

            #Tell self it's over
            quest::signalwith(201425,2,5);
            #Everyone exited - Tell the tribunal it's over
            quest::signalwith(201078, 0, 5);
            quest::stoptimer("trial_eject");
            #Make sure agent doesn't think boss is up
            quest::signalwith(201075,11,2);
            @allowed = ();
            quest::settimer("clear_corpses", 60);
            HandleCorpses();
            $proximity_check_delay = 30;
            }
      }
      
      quest::settimer("proximity_check", $proximity_check_delay);
   }
   elsif ($timer eq "trial_lock") {
      quest::stoptimer("trial_lock");
      $allow_entry = 0;
   }
   elsif ($timer eq "execution_wave1") {
      quest::stoptimer("execution_wave1");
      SpawnExecutionMobs();      
      if (!defined $mob_check) {
         $mob_check = 1;
         $mob_count = 4;
      }   
   }
   elsif ($timer eq "execution_wave2") {
      quest::stoptimer("execution_wave2");
      SpawnExecutionMobs();      
      if (!defined $mob_check) {
         $mob_check = 1;
         $mob_count = 4;
      }      
   }
   elsif ($timer eq "execution_wave3") {
      quest::stoptimer("execution_wave3");
      SpawnExecutionMobs();      
      if (!defined $mob_check) {
         $mob_check = 1;
         $mob_count = 4;
      }
   }
   elsif ($timer eq "execution_wave4") {
      quest::stoptimer("execution_wave4");
      SpawnExecutionMobs();      
      if (!defined $mob_check) {
         $mob_check = 1;
         $mob_count = 4;
      }   
   }   
   elsif ($timer eq "trial_eject") {
      quest::stoptimer("trial_eject");
      quest::stoptimer("proximity_check");
      
      #Eject everyone from trial area
      foreach $player (@trial_group) {
         $c = $entity_list->GetClientByName($player);
         
         if ($c) {
            $c->MovePC(201,456,825,9, 1);
            $c->Message(15, "A mysterious force translocates you.");
         }
      }
      
      #Clear lists
      @allowed = ();
      @trial_group = ();
      #Tell the tribunal it's over
      quest::signalwith(201078, 0, 5);
      $proximity_check_delay = 30;
      quest::settimer("proximity_check", $proximity_check_delay);
   }
   elsif ($timer eq "clear_corpses") {
      quest::stoptimer("clear_corpses");
      HandleCorpses();
      quest::settimer("clear_corpses", 60);
   }
}

sub HandleCorpses {

   if ($move_client_corpses) {
      #Move player corpses to graveyard
      @clist = $entity_list->GetCorpseList();
      foreach $ent (@clist) {
         if ($ent->IsPlayerCorpse()) {
            if ($ent->CalculateDistance(194, -1120, 72) < 120) {
               $ent->GMMove(58, -47, 2);
            }
         }
      }
   }
   
   #Delete npc corpses left in trial area
   foreach $id (@mob_ids) {
      $corpse_id = $entity_list->GetCorpseByID($id);
      if (defined $corpse_id) {
         if ($corpse_id->CalculateDistance(194, -1120, 72) < 120) {
            $corpse_id->Delete();
         }
      }
   }
   
   #Clear list
   @mob_ids = ();
}

sub SpawnExecutionMobs {
   #for our Loop
   my $count = 1;
   
   #Locations to spawn mobs at
   my @locX = qw(168 168 224 224);
   my @locY = qw(-1121 -1071 -1071 -1121);
   my @locZ = qw(73 73 73 73);
   my @locH = qw(180 180 180 180);
   
   #Only allow a max of 1 of each named per wave
   my $herald = 0;
   my $priest = 0;
   
   #Loop And spawn, baby.
   for ($count = 0; $count <= 3; $count++) {
      my $test = int(rand(99));
      
      if (($test >= 0) && ($test <=19)) {
         quest::spawn2(201427, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
      }
      
      elsif (($test >= 20) && ($test <=39)) {
         quest::spawn2(201429, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
      }
      
      elsif (($test >= 40) && ($test <=64)) {
         quest::spawn2(201430, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
      }
      
      elsif (($test >= 65) && ($test <=91)) {
         quest::spawn2(201428, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
      }
      
      elsif (($test >= 92) && ($test <=95)) {
         if (!$priest) {
            quest::spawn2(201431, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
            $priest = 1;
         }
         else {
            quest::spawn2(201428, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
         }
      }
      
      else {
         if (!$herald) {
            quest::spawn2(201432, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
            $herald = 1;
         }
         else {
            quest::spawn2(201428, 0, 0, $locX[$count], $locY[$count], $locZ[$count], $locH[$count]);
         }
      }
      
      if ($spawn_ex == 1) {
         #Spawn An_Executioner (201439)
         quest::spawn2(201439,0,0,232,-1048,74,180);
         #Signal Exe to set wave/speed
         quest::signalwith(201439, $wave, 100);
         $spawn_ex = 0;
      }
   }
}

