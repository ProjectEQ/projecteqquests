#NPC: Minotaur_Hero   Zone: steamfontmts

sub EVENT_COMBAT {
  if($combat_state == 1){
    quest::say("<Snort!!>.. For Meldrath!!");
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::say("I die soon! Meldrath, help me!");
}