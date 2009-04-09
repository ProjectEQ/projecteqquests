#NPC: Minotaur_Lord   Zone: steamfont

sub EVENT_AGGRO{
    quest::say("I survived the gladiator pens of Qeynos!! What can you do to one such as I?!!");
}

sub EVENT_DEATH{
  quest::say("I die soon! Meldrath, help me!");
}
