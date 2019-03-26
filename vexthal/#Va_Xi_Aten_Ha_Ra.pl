# Warder control for 3rd raid target(s) on 2nd floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158094,0,0,368.0,0.2,128.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,498.9,0.2,128.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,593.4,0.2,128.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,143.0,-0.4,128.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1153.7,0.3,236.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1106.0,0.3,236.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1184.8,-26.6,236.1,0.0); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1184.8,26.6,236.1,254); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1238.8,0.0,233.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1348.9,0,233.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1380.0,-55.0,233.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1380.0,55.0,233.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1314.8,-85.0,233.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158094,0,0,1314.8,85.0,233.1,380); # NPC: Akhevan_Warder
}

sub EVENT_DEATH_COMPLETE {
  quest::depopall(158094);
}

#End of File, Zone:vexthal  NPC:158009 -- #Va_Xi_Aten_Ha_Ra
