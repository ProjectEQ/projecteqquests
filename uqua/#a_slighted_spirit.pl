sub EVENT_SPAWN {
  quest::settimer(1,30);
}

sub EVENT_TIMER {
  quest::depop();
}

sub EVENT_SLAY {
  quest::spawn2(quest::ChooseRandom(292043,292044,292045,292046,292047,292048,292049,292050),0,0,$x,$y,$z,$h); # NPC(s): #a_coercing_spirit (292043), #a_malevolent_spirit (292044), #a_slighted_spirit (292045), #a_spiteful_spirit (292046), #a_vengeful_spirit (292047), #a_vindictive_spirit (292048), #an_avenging_spirit (292049), #an_infuriated_spirit (292050)
}