sub EVENT_SPAWN {
  # Monk Epic 1.0
 if(($class eq "Monk") && ($ulevel>=46)) {
  quest::attack($name);
 }
}
# End of File