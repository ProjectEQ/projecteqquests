sub EVENT_SPAWN {
  my $min = 1;
  my $range = 4;
  my $randomspawn = int(rand($range)) + $min;

  plugin::RandomRoam(250, 250);
  quest::settimer(1, $randomspawn);
}

sub EVENT_TIMER {
  plugin::RandomRoam(250, 250);
}

sub EVENT_CAST_ON {
  if (quest::istaskactive(212) && ($spell_id = 3089)) {
    quest::updatetaskactivity(212, 0, 1);
    quest::faction(98, -30); #Fallen of Bloody Kithicor
  }
}