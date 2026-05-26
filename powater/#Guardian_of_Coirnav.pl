#Guardian_of_Coirnav
#Signals coirnav_controller with the Event start

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
  if (IsInstancePoWater()) {
    return;
  }

  my $lockout = quest::get_data("powater-ow-coirnav_done");
  if (defined $lockout && $lockout ne "" && int($lockout) == 3) {
    quest::settimer(1, 3);
  }
}

sub EVENT_AGGRO {
  quest::say("We are the protectors and guardians of this domain, death is all you will find here.");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("Even now Coirnav awaits to deal swift death to you. Flee, weaklings.");
  quest::signalwith(216107, 1, 0);
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop_withtimer();
}
