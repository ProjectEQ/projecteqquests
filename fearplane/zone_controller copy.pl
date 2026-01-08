# this requires the Zone:UseZoneController rule to be enabled
my $initialized = 0;

sub Initialize {
  quest::debug("Initializing expedition");
  my $dz = quest::get_expedition();
  if ($dz) {
    # bind unique npc types to events to prevent any looting exploits
#    $dz->SetLootEventByNPCTypeID(72003, "Cazic Thule"); # npc: Cazic Thule
	quest::spawn2(89185, 0, 0, 1076, -808.35, 100.91, 315.25); # npc: agent_of_chaos
  }
  
}

sub EVENT_SPAWN_ZONE {
  # note: zone_controller spawns before expeditions can be cached, so we delay
  # expedition init until first npc spawns instead of using our EVENT_SPAWN
  if (!$initialized) {
    $initialized = 1; # set first to prevent infinite recursion from spawning npcs in init()
    Initialize();
  }

  if ($spawned_npc_id == 72003) { # npc: Cazic Thule
    my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Plane of Fear")) {
      quest::depop(72003); # depop Plane of Fear due to lockout
    }
  }
  
}

sub EVENT_DEATH_ZONE {
  if ($killed_npc_id == 72003 || $killed_npc_id == 72100) { # npc: Cazic Thule
    my $dz = quest::get_expedition();
    if ($dz) {
      $dz->AddLockout("Plane of Fear", 259200); # 3 day lockout
	  $dz->AddReplayLockout(259200); # 3 day lockout
    }
  }
}