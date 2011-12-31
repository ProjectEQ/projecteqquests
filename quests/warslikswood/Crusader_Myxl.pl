sub EVENT_COMBAT {
  if($combat_state == 1) {
    quest::say("You cannot hope to defeat a Crusader of Greenmist!!");
  }
}

sub EVENT_DEATH {
  quest::say("Ha ha!! Fool.. The Crusaders of Greenmist shall torture you to death! Ha ha!!");
}