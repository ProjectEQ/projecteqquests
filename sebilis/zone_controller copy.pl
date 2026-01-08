# this requires the Zone:UseZoneController rule to be enabled
my $initialized = 0;

sub Initialize {
  quest::debug("Initializing expedition");
  my $dz = quest::get_expedition();
  if ($dz) {
    # bind unique npc types to events to prevent any looting exploits
    $dz->SetLootEventByNPCTypeID(89181, "Trakanon"); # npc: Trakanon
	$dz->SetLootEventByNPCTypeID(89128, "Trakanon"); # npc: Trakanon
	$dz->SetLootEventByNPCTypeID(89154, "Trakanon"); # npc: Trakanon
	quest::spawn2(89185, 0, 0, -14.20, 213.30, 40.06, 10); # npc: agent_of_chaos
  }
  
      # spawn any events that the expedition doesn't have a lockout fo

  
}

sub EVENT_SPAWN_ZONE {
  # note: zone_controller spawns before expeditions can be cached, so we delay
  # expedition init until first npc spawns instead of using our EVENT_SPAWN
  if (!$initialized) {
    $initialized = 1; # set first to prevent infinite recursion from spawning npcs in init()
    Initialize();
  }

  if ($spawned_npc_id == 89181) { # npc: Trakanon
    my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Trakanon")) {
      quest::depop(89181); # depop trakanon due to lockout
    }
  }
  
  if ($spawned_npc_id == 89154) { # npc: Trakanon
    my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Trakanon")) {
      quest::depop(89154); # depop trakanon due to lockout
    }
  }
  
  
  if ($spawned_npc_id == 89128) { # npc: hard Trakanon
    my $dz = quest::get_expedition();
    if ($dz && $dz->HasLockout("Trakanon")) {
      quest::depop(89128); # depop hard trakanon due to lockout
    }
  }
}

#sub EVENT_DEATH_ZONE {
#  if ($killed_npc_id == 89181 || $killed_npc_id == 89128 || $killed_npc_id == 89154) { # npc: Trakanon or hard Trakanon or bard epic version
#    my $dz = quest::get_expedition();
#    if ($dz) {
#      $dz->AddLockout("Replay Timer", 259200); # 3 day lockout
#    }
#  }
#  
#  if ($killed_npc_id == 89181 || $killed_npc_id == 89128 || $killed_npc_id == 89154) { # npc: Trakanon or hard Trakanon or bard epic version
#    my $dz = quest::get_expedition();
#    if ($dz) {
#      $dz->AddLockout("Trakanon", 259200); # 3 day lockout
#    }
#  }
#}

sub EVENT_DEATH_ZONE {
  # Define the NPC IDs in a hash for quick lookups
  my %npc_ids = map { $_ => 1 } (89181, 89128, 89154); # npc: Trakanon or hard Trakanon or bard epic version

  # Check if $killed_npc_id exists in the hash
  if (exists $npc_ids{$killed_npc_id}) {
    my $dz = quest::get_expedition();
    if ($dz) {
      $dz->AddLockout("Replay Timer", 259200); # 3 day lockout
    }
  }

  if (exists $npc_ids{$killed_npc_id}) {
    my $dz = quest::get_expedition();
    if ($dz) {
      $dz->AddLockout("Trakanon", 259200); # 3 day lockout
    }
  }
}