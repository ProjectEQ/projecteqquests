sub EVENT_AGGRO {
	quest::emote("on a fresh grave and the soil around you springs to life!");
	quest::spawn2(quest::ChooseRandom(160432,160451,160431,160420),0,0,$x,$y,$z,$h); # NPC(s): a_muddy_corpse (160432), a_ghastly_apparition (160451), a_molded_skeleton (160431), a_reanimated_corpse (160420)
	quest::depop_withtimer();
}
