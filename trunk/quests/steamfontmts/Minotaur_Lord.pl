#NPC: Minotaur_Lord   Zone: steamfontmts

sub EVENT_AGGRO {
  quest::say("I survived the gladiator pens of Qeynos!! What can you do to one such as I?!!");
}

sub EVENT_DEATH_COMPLETE {
  quest::say("I die soon! Meldrath, help me!");
}