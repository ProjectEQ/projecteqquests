sub EVENT_AGGRO {
	quest::spawn2(quest::ChooseRandom(173077,173093),0,0,$x,$y,$z,$h); # NPC(s): a_mind_burrower (173077), a_mind_burrower (173093)
	quest::depop_withtimer();
}
