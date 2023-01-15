my $status; #Event Status (Not ready: -1, Ready: 0, Active: 1)
my $master = 56189; #Yama_Twerik (steamfont)

sub EVENT_SPAWN {
  $status = 0; #Event ready, not active
  quest::settimer("laydown", 3);
}

sub EVENT_SIGNAL {
  if ($signal == 0) { #Status check
    SEND_STATUS();
  }
  if ($signal == 1) { #Begin event
    if ($status == 0) {
      $status = 1;
    }
  }
  if ($signal == 2) { #Reset event
    $status = 0;
  }
}

sub EVENT_CAST_ON {
  if ($spell_id == 5596) { #Spell: Electrical Charge
    my $player = quest::get_data("Yama_Event");
    if (($status == 1) && ($player == $client->CharacterID())) {
      quest::signalwith($master, 3); #Charge expected by this player
    }
    else {
      quest::signalwith($master, -1); #Charge not expected by this player
    }
    $status = 0;
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 1) {
    $status = -1;
  }
  else {
    $status = 0;
  }
  SEND_STATUS();
}

sub EVENT_DEATH_COMPLETE {
  $status = -1;
  SEND_STATUS();
}

sub SEND_STATUS {
  quest::signalwith($master, $status);
}

sub EVENT_TIMER {
  quest::stoptimer("laydown");
  $npc->SetAppearance(2); #Kneel (some clients won't lay down without a different appearance first)
  $npc->SetAppearance(3); #Lay down
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}