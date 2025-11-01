# quests/ssratemple/#EmpCycle.pl
# Seed once (no respawn), then swap to Real Emperor when the Golem dies.
# Robust: works even if the death signal is lost (polling watcher).

my $NT_GOLEM    = 162064;   # #Ssraeshzian_Blood_Golem
my $NT_EMP_NT   = 162065;   # #Emperor_Ssraeshza (No Target)
my $NT_EMP_REAL = 162227;   # #Emperor_Ssraeshza_ (Real)

# For testing, keep this 0 so the swap is instant after Golem death.
# Change back to 150 if you want a 2m30s build-up later.
my $PREP_TIME_SEC = 0;

my $seeded  = 0;   # seeded encounter this controller lifetime
my $swapped = 0;   # performed NT -> Real swap

sub _is_up { return $entity_list->IsMobSpawnedByNpcTypeID($_[0]); }

sub _seed_once {
  return if $seeded;
  # Only seed if Real/NT aren't already up (fresh instance or fresh controller)
  if (!_is_up($NT_EMP_REAL) && !_is_up($NT_EMP_NT)) {
    quest::unique_spawn($NT_GOLEM,  0, 0, 877, -325, 400.5, 384);
    quest::unique_spawn($NT_EMP_NT, 0, 0, 990, -325, 415,   384);
    quest::ze(15, "[EmpCycle] Seeded Golem (162064) + NT Emperor (162065).");
  } else {
    quest::ze(15, "[EmpCycle] Skipping seed; NT/Real Emperor already up.");
  }
  $seeded = 1;
}

sub _begin_swap {
  return if $swapped;
  quest::ze(15, sprintf("[EmpCycle] Preparing Real Emperor in %ds.", $PREP_TIME_SEC));
  quest::settimer("EmpPrep", $PREP_TIME_SEC);
}

sub _do_swap_now {
  quest::stoptimer("EmpPrep");
  quest::depop($NT_EMP_NT);
  quest::unique_spawn($NT_EMP_REAL, 0, 0, 990, -325, 415, 384);
  quest::ze(15, "[EmpCycle] Real Emperor (162227) spawned. Activating.");
  quest::signalwith($NT_EMP_REAL, 1, 1);  # unlock + hate nudge
  $swapped = 1;
}

sub EVENT_SPAWN {
  quest::ze(15, sprintf("[EmpCycle] Controller up (npc_type=%d). Seeding once & starting watcher.", $npc->GetNPCTypeID()));
  _seed_once();
  # Watcher ONLY checks for golem death; it never reseeds.
  quest::settimer("Watch", 5);  # seconds
}

sub EVENT_SIGNAL {
  # Redundant path: if the Golem sends signal 1, we honor it
  if ($signal == 1 && !$swapped) {
    quest::ze(15, "[EmpCycle] Received signal 1 (Golem/Blood died).");
    _begin_swap();
  }
}

sub EVENT_TIMER {
  if ($timer eq "Watch") {
    # If we've seeded and haven't swapped yet and the GOLEM is gone -> trigger swap
    if ($seeded && !$swapped && !_is_up($NT_GOLEM)) {
      quest::ze(15, "[EmpCycle] Watcher detected Golem is dead; initiating swap.");
      _begin_swap();
    }
    # Never reseed; the watcher only observes state
  }
  elsif ($timer eq "EmpPrep") {
    _do_swap_now();
  }
}
