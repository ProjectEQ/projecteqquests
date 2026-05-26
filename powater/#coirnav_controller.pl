my $namedcount = 0;

my $FAIL_SECONDS     = 1895;
my $DATA_TTL         = "M32";
my $DZ_LOCKOUT_NAME  = "Reef of Coirnav";
my $DZ_LOCKOUT_SEC   = 32400; # 9 hours
my $EVENT_PREFIX     = "coirnav";

sub ScopeInstanceId {
  if (defined $instanceid && $instanceid > 0) {
    return $instanceid;
  }
  my $iid = quest::GetInstanceID("powater", 2);
  if (!$iid || $iid == 0) {
    $iid = quest::GetInstanceID("powater", 1);
  }
  return $iid || 0;
}

sub IsInstancePoWater {
  return ScopeInstanceId() > 0;
}

sub OwLockoutKey {
  return "powater-ow-coirnav_done";
}

sub SetOwLockout {
  my ($duration) = @_;
  quest::set_data(OwLockoutKey(), 3, $duration);
}

sub EventDataKey {
  my ($suffix) = @_;
  my $iid = ScopeInstanceId();
  if ($iid > 0) {
    return "powater-${iid}-${suffix}";
  }
  return "powater-ow-${suffix}";
}

sub GetCoirnavWave {
  my $w = quest::get_data(EventDataKey("${EVENT_PREFIX}_wave"));
  if (defined $w && $w ne "") {
    return int($w);
  }
  return 0;
}

sub SetCoirnavWave {
  my ($val) = @_;
  quest::set_data(EventDataKey("${EVENT_PREFIX}_wave"), $val, $DATA_TTL);
}

sub ClearCoirnavEventState {
  quest::delete_data(EventDataKey("${EVENT_PREFIX}_wave"));
  quest::delete_data(EventDataKey("${EVENT_PREFIX}_fail_at"));
}

sub ApplyDzLockout {
  return unless IsInstancePoWater();
  my $dz = quest::get_expedition();
  if ($dz) {
    $dz->AddLockout($DZ_LOCKOUT_NAME, $DZ_LOCKOUT_SEC);
  }
}

sub SetFailDeadline {
  my $fail_at = time() + $FAIL_SECONDS;
  quest::set_data(EventDataKey("${EVENT_PREFIX}_fail_at"), $fail_at, $DATA_TTL);
  quest::settimer(1, $FAIL_SECONDS);
}

sub RehydrateEventTimers {
  my $fail_at = quest::get_data(EventDataKey("${EVENT_PREFIX}_fail_at"));
  return unless (defined $fail_at && $fail_at ne "");
  my $remaining = int($fail_at) - time();
  if ($remaining > 0) {
    quest::settimer(1, $remaining);
  } else {
    TriggerEventFail();
  }
}

sub TriggerEventFail {
  quest::stopalltimers();

  quest::depopall(216071);
  quest::depopall(216076);
  quest::depopall(216074);
  quest::depopall(216060);
  quest::depopall(216067);
  quest::depopall(216057);

  quest::signalwith(216048, 7, 0);
  quest::signalwith(216094, 7, 0);

  quest::depop(216061);
  quest::depop(216070);
  quest::depop(216065);
  quest::depop(216094);
  quest::depop(216108);
  quest::depop(216109);
  quest::depop(216110);

  ClearCoirnavEventState();

  if (!IsInstancePoWater()) {
    SetOwLockout("H2");
  }

  ApplyDzLockout();
  quest::settimer(7, 45);
}

sub EVENT_SPAWN {
  quest::stopalltimers();
  RehydrateEventTimers();
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    SPAWN_WAVE1();

  } elsif ($signal == 2) {
    if (GetCoirnavWave() == 4) {
      my $pweloncheck = $entity_list->GetMobByNpcTypeID(216109);
      my $nrindacheck = $entity_list->GetMobByNpcTypeID(216108);
      my $vamuilcheck = $entity_list->GetMobByNpcTypeID(216110);
      if (!$pweloncheck && !$nrindacheck && !$vamuilcheck) {
        quest::depop(216048);
        SPAWN_WAVE5();
      }
    }

  } elsif ($signal == 4) {
    if (GetCoirnavWave() == 3) {
      my $check_trash1 = $entity_list->GetMobByNpcTypeID(216071);
      my $check_trash2 = $entity_list->GetMobByNpcTypeID(216076);
      my $check_trash3 = $entity_list->GetMobByNpcTypeID(216060);
      if (!$check_trash1 && !$check_trash2 && !$check_trash3) {
        quest::depop(216070);
        quest::depop(216065);
        quest::depop(216061);
        quest::spawn2(216109, 0, 0, $x + 5, $y - 20, $z + 5, 138);
        quest::spawn2(216108, 0, 0, $x - 10, $y, $z + 5, 138);
        quest::spawn2(216110, 0, 0, $x + 5, $y + 20, $z + 5, 138);
        SetCoirnavWave(4);
      }
    }

  } elsif ($signal == 5) {
    quest::stopalltimers();
    quest::depopall(216074);
    quest::depopall(216067);
    quest::depopall(216057);

    ClearCoirnavEventState();

    if (!IsInstancePoWater()) {
      SetOwLockout("H4");
    }

    ApplyDzLockout();
    quest::spawn2(216066, 0, 0, $x, $y, $z, 138);
  }
}

sub EVENT_TIMER {
  if ($timer == 1) {
    TriggerEventFail();
    return;
  }

  if ($timer == 2) {
    SPAWN_WAVE2();
  }

  if ($timer == 3) {
    SPAWN_WAVE3();
  }

  if ($timer == 4) {
    quest::ze(0, "Coirnav the Avatar of Water is suddenly surrounded by a slight glow. A low constant humming is heard in the background.");
    quest::stoptimer(4);
  }

  if ($timer == 5) {
    quest::ze(0, "Coirnav the Avatar of Water is now glowing noticeably brighter and the constant humming is getting louder.");
    quest::stoptimer(5);
  }

  if ($timer == 6) {
    quest::ze(0, "Coirnav the Avatar of Water glows to brilliant flash of light that suddenly fades. The constant humming suddenly becomes a deafening roar that also mysteriously fades away.");
    quest::stoptimer(6);
  }

  if ($timer == 7) {
    quest::stoptimer(7);
    KICK_ALL_PLAYERS();
  }

  if ($timer == 8) {
    if (GetCoirnavWave() == 3) {
      my $check_trash1 = $entity_list->GetMobByNpcTypeID(216071);
      my $check_trash2 = $entity_list->GetMobByNpcTypeID(216076);
      my $check_trash3 = $entity_list->GetMobByNpcTypeID(216060);
      if (!$check_trash1 && !$check_trash2 && !$check_trash3) {
        SPAWN_WAVE4();
      }
    }
  }

  if ($timer == 9) {
    if (GetCoirnavWave() == 4) {
      my $pweloncheck = $entity_list->GetMobByNpcTypeID(216109);
      my $nrindacheck = $entity_list->GetMobByNpcTypeID(216108);
      my $vamuilcheck = $entity_list->GetMobByNpcTypeID(216110);
      if (!$pweloncheck && !$nrindacheck && !$vamuilcheck) {
        quest::depop(216048);
        SPAWN_WAVE5();
      }
    }
  }
}

sub KICK_ALL_PLAYERS {
  foreach $pc ($entity_list->GetClientList()) {
    $pc->MovePC(202, 1456, -1, -100, 0);
  }
}

sub SPAWN_WAVE1 {
  SetFailDeadline();
  quest::settimer(2, 580);
  quest::settimer(3, 800);
  quest::settimer(4, 600);
  quest::settimer(5, 1220);
  quest::settimer(6, 1440);

  quest::signalwith(216048, 1, 0);
  my $count = 0;
  while ($count <= 24) {
    $randX = int(rand(55));
    $randY = int(rand(75));
    $randZ = int(rand(20));
    $randH = int(rand(260));
    $randPNX = int(rand(2));
    $randPNY = int(rand(2));
    $randPNZ = int(rand(2));
    if ($randPNX == 1) { $randX = -$randX; }
    if ($randPNY == 1) { $randY = -$randY; }
    if ($randPNZ == 1) { $randZ = -$randZ; }
    quest::spawn2(216071, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    $count++;
  }
  quest::spawn2(216070, 0, 0, $x + 5, $y - 20, $z + 5, 138);
  SetCoirnavWave(1);
}

sub SPAWN_WAVE2 {
  quest::signalwith(216048, 2, 0);
  my $count = 0;
  while ($count <= 24) {
    $randX = int(rand(55));
    $randY = int(rand(75));
    $randZ = int(rand(20));
    $randH = int(rand(260));
    $randPNX = int(rand(2));
    $randPNY = int(rand(2));
    $randPNZ = int(rand(2));
    if ($randPNX == 1) { $randX = -$randX; }
    if ($randPNY == 1) { $randY = -$randY; }
    if ($randPNZ == 1) { $randZ = -$randZ; }
    quest::spawn2(216076, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    $count++;
  }
  quest::spawn2(216061, 0, 0, $x - 10, $y, $z + 5, 138);
  SetCoirnavWave(2);
  quest::stoptimer(2);
}

sub SPAWN_WAVE3 {
  quest::settimer(8, 1);
  quest::signalwith(216048, 3, 0);
  my $count = 0;
  while ($count <= 24) {
    $randX = int(rand(55));
    $randY = int(rand(75));
    $randZ = int(rand(20));
    $randH = int(rand(260));
    $randPNX = int(rand(2));
    $randPNY = int(rand(2));
    $randPNZ = int(rand(2));
    if ($randPNX == 1) { $randX = -$randX; }
    if ($randPNY == 1) { $randY = -$randY; }
    if ($randPNZ == 1) { $randZ = -$randZ; }
    quest::spawn2(216060, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    $count++;
  }
  quest::spawn2(216065, 0, 0, $x + 5, $y + 20, $z + 5, 138);
  SetCoirnavWave(3);
  quest::stoptimer(3);
}

sub SPAWN_WAVE4 {
  quest::depop(216070);
  quest::depop(216065);
  quest::depop(216061);
  quest::spawn2(216109, 0, 0, $x + 5, $y - 20, $z + 5, 138);
  quest::spawn2(216108, 0, 0, $x - 10, $y, $z + 5, 138);
  quest::spawn2(216110, 0, 0, $x + 5, $y + 20, $z + 5, 138);
  SetCoirnavWave(4);
  quest::stoptimer(8);
  quest::settimer(9, 1);
}

sub SPAWN_WAVE5 {
  my $count = 0;
  while ($count <= 26) {
    $randX = int(rand(55));
    $randY = int(rand(75));
    $randZ = int(rand(20));
    $randH = int(rand(260));
    $randPNX = int(rand(2));
    $randPNY = int(rand(2));
    $randPNZ = int(rand(2));
    if ($randPNX == 1) { $randX = -$randX; }
    if ($randPNY == 1) { $randY = -$randY; }
    if ($randPNZ == 1) { $randZ = -$randZ; }
    if ($count <= 9) {
      quest::spawn2(216057, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    } elsif (($count >= 10) && ($count <= 18)) {
      quest::spawn2(216067, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    } elsif (($count >= 19) && ($count <= 26)) {
      quest::spawn2(216074, 0, 0, $x + $randX, $y + $randY, $z + $randZ, $randH);
    }
    $count++;
  }
  quest::spawn2(216094, 0, 0, $x, $y, $z - 10, 138);
  SetCoirnavWave(5);
  quest::stoptimer(9);
}
