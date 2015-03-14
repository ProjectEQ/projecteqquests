sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome friend. May I help you?");
  }
}

sub EVENT_SIGNAL {
  if ($signal == 1) {
    quest::say("Is the energy related to the Spirits, sire?");
  }
  if ($signal == 2) {
    quest::say("... but, what sort of energy is it sire? Can you understand its nature?");
  }
}
#END of FILE Zone:sharvahl  ID:155218 -- Apprentice_Siason