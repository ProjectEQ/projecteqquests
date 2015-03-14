my $animals_dead = 0;
my $bites = 0;

sub EVENT_SPAWN {
  #safety set of variables to 0 on spawn since PEQ has been shown to still fire timer events.
  $animals_dead = 0;
  $bites = 0;
}

sub EVENT_SAY {
  # Upon hailing, start the event and signal to Durgin Skell that event 4 has now been attempted
  if ($text=~/hail/i) {
    quest::ze(15, "It is odd that Sharalla's warder remains here after her demise. It seems to be defending its master's remains. The warder turns toward you as it notices your presence. The moment it is distracted, several wild animals that had been hiding nearby lunge forth.");
    quest::signalwith(237743,4,1);

    quest::spawn2(237793, 12, 0, 20.26, -107.10, 6.60, 0); # a_starving_polar_bear (237793) - grid 12
    quest::spawn2(237794, 0, 0, -125.62, -953.26, 53.10, 0); # a_ravenous_snow_cougar (237794)
    quest::spawn2(237795, 0, 0, -49.11, -945.02, 53.10, 0); # a_ravenous_snow_cougar (237795)
    quest::spawn2(237796, 0, 0, -142.91, -915.59, 55.32, 0); # a_famished_leopard (237796)
  }
}

sub EVENT_SIGNAL {
  #Signal 1 comes from the animals trying to destroy Sharalla's corpse
  if ($signal == 1) {
    $bites = $bites + 1;
    quest::ze(15, "One of the feral animals gnaws the remains of Sharalla, tearing at her clothes and skin. Her warder utters a pitiful whine.");
    # Too many bites yields a failure of the event
    if ($bites >= 10) {
      quest::depopall(237793); # a_starving_polar_bear
      quest::depopall(237794); # a_ravenous_snow_cougar
      quest::depopall(237795); # a_ravenous_snow_cougar
      quest::depopall(237796); # a_famished_leopard
      quest::depopall(237772); # Sharalla's warder
      quest::depopall(237773); # Sharalla's corpse
      quest::ze(15, "Sharalla's remains have been irreversibly defiled by the wild animals. You have failed to protect her.");
    }
  }
  #Signal 2 comes from the animals when they die
  if ($signal == 2) {
    $animals_dead = $animals_dead + 1;
    # if all animals are dead, signal to Durgin Skell one more time to indicate the event was successfully completed
    if ($animals_dead >= 4) {
      #Text missing. Using this to indicate successful task 4
      quest::ze(15, "You have protected Sharalla's body from the hungry animals of the caverns. Return to Durgin Skell to let him know she will rest peacefully.");
      quest::signalwith(237743, 4, 1);
    }
  }
}