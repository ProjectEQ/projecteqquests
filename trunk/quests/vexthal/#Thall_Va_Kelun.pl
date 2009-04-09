# Warder control for 1st raid target(s) on 2nd floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158090,0,0,1736.1,-250.1,115.6,0);
	quest::spawn2(158090,0,0,1736.1,250.1,115.6,127.0);
}

sub EVENT_DEATH {
  quest::depopall(158090);
}

#End of File, Zone:vexthal  NPC:158008 -- #Thall_Va_Kelun