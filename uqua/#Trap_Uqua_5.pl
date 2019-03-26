#rage trap 2

sub EVENT_SPAWN {
  quest::set_proximity($x-25,$x+25,$y-25,$y+25,$z-25,$z+25);
}

sub EVENT_ENTER {
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-691,-1239,3,256); # NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-680,-1213,3,262); # NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
  quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),4,0,-701,-1212,3,262); # NPC(s): #a_trusik_anchorite (292029), #a_trusik_ritualist (292005), #a_trusik_ascetic (292030), #a_trusik_ascetic (292001), #a_trusik_stalker (292006), #a_trusik_summoner (292002)
  quest::ze(15,"A low-pitched voice rumbles, Here the trespassers come. They've almost reached the threshold of the Chamber of Rage. Ambush them, now!");
  quest::depop_withtimer();
}
