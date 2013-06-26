# Zone: PoTactics    ID: 214113 -- #Rallos_Zek_the_Warlord
#
# Qazzaz - 03/28/10      Fixed mobs respawning during event.   * Requires plugin file GetSpawn2IDs.pl *
# Qazzaz - 03/17/10      Redid the way 03/16/10 changes were implimented using Cavedues, KLSs and Trevius' infos
#                  Using $npc->IsEngaged() for when losing agro
# Qazzaz - 03/16/10      Depops Chaos Waiths when RZ loses all agro.  No longer a all or nothing event.
#                  Depops the pit of normal mobs every 5 seconds.  No more random respawn interfering with the event for long.
my $mob1;
my $mobnpc1;
my @depopnpclist =   (214000,214001,214002,214003,214006,214008,214012,214015,214016,214017,214018,214019,214020,214021,214022,
            214023,214024,214025,214027,214028,214029,214030,214038,214040,214043,214045,214046,214047,214048,214059,
            214070,214077,214078,214079,214080,214081,214085,214087,214088,214089,214090,214091,214093,214094,214095,214097,
            214098,214099,214100,214101,214102,214103,214106,214122,214114);
            
sub EVENT_SPAWN {
quest::settimer(2,7200);   # 2 hours to kill him
foreach my $mobsid (@depopnpclist) {   # Depsawn all the mobs in the pit
   quest::depopall($mobsid);
   }

foreach my $mobsid (plugin::GetSpawn2GroupsFromArray(\@depopnpclist)) {
   quest::updatespawntimer($mobsid,7500000);   # Set pit mobs to respawn again in 2 hours 5 minutes
   }
}

sub EVENT_AGGRO {
        quest::settimer(1,60);
}

sub EVENT_DEATH {
   quest::spawn2(214105,0,0,699,8,-294,64);   # spawn a_planar_projection
   quest::stoptimer(2);
   quest::stoptimer(1);
   quest::signalwith(214123, 214113);         # let the trigger know RZtW died
   quest::depopall(214114);
   foreach my $mobsid (plugin::GetSpawn2GroupsFromArray(\@depopnpclist)) {   # Set pit mobs to respawn in 30 minutes.
      quest::updatespawntimer($mobsid,1800000);
   }
}

sub EVENT_TIMER {
   if($timer == 2) {
        quest::stoptimer(2);
        quest::stoptimer(1);
        quest::depopall(214114);
      quest::depop();
    }

   if($timer == 1) {
      if($npc->IsEngaged()) {
         quest::spawn2(214114,0,0,565,-95,-293,66);
         quest::spawn2(214114,0,0,815,-100,-293,255);
         quest::spawn2(214114,0,0,815,-295,-293,68);
         quest::spawn2(214114,0,0,565,185,-293,0);
         $mob1 = $entity_list->GetMobID(214114);
         $mobnpc1 = $mob1->CastToNPC();
         $mobnpc1->AddToHateList($npc->GetHateTop());
      } else {
         quest::depopall(214114);   # Depop the adds since RZ is not currently agroed.
         quest::stoptimer(1);
      }
   }
}

# End of file   Zone: PoTactics    ID: 214113 -- #Rallos_Zek_the_Warlord 