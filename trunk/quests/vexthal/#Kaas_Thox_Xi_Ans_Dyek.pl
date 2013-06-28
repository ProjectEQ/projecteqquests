# Warder control for first raid target on 1st floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158087,0,0,626.0,256.0,6.25,190.0);
	quest::spawn2(158087,0,0,626.0,-256.0,6.25,190.0);
}

sub EVENT_DEATH_COMPLETE {
	quest::depopall(158087);
}

#End of File, Zone:vexthal  NPC:158013 -- #Kaas_Thox_Xi_Ans_Dyek