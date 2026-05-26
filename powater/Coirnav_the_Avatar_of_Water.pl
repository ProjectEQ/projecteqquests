#216048 - Fake (But still aggressive) Corirnav_the_Avatar_of_Water

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

sub EVENT_SPAWN {
  if (!IsInstancePoWater() && defined $qglobals{coirnav_done}) {
    quest::delglobal("coirnav_done");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by Povar! Come forth my minions of vapor and destroy these intruders.");
  } elsif ($signal == 2) {
    quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by E`ci! Come forth my minions of ice and destroy these intruders.");
  } elsif ($signal == 3) {
    quest::shout("Those that violate my domain will pay. I call upon the power imbued to me by Tarew Marr! Come forth minions of water and destroy these intruders.");
  } elsif ($signal == 7) {
    quest::shout("Violaters of this plane be banished from this domain!");
  }
}
