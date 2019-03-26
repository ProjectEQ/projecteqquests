# Warder control for 2nd raid target(s) on 2nd floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158091,0,0,880.0,0,126.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158091,0,0,941.0,0,126.1,380); # NPC: Akhevan_Warder
	quest::spawn2(158091,0,0,755.7,0,126.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158091,0,0,740.0,45.0,126.1,126); # NPC: Akhevan_Warder
	quest::spawn2(158091,0,0,740.0,-45.0,126.1,126); # NPC: Akhevan_Warder
}

sub EVENT_DEATH_COMPLETE {
  quest::depopall(158091);
}

#End of File, Zone:vexthal  NPC:158011 -- #Thall_Xundraux_Diabo
