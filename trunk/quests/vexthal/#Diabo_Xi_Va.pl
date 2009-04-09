# Warder control for 2nd raid target(s) on 1st floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158088,0,0,1874.4,2.1,3.1,190.0);
	quest::spawn2(158088,0,0,1767.3,2.3,67.1,63.0);
	quest::spawn2(158088,0,0,1837.0,1.9,63.1,63.0);
	quest::spawn2(158088,0,0,1736.6,-64.3,63.1,63.0);
	quest::spawn2(158088,0,0,1736.6,64.3,63.1,63.0);
}

sub EVENT_DEATH {
  quest::depopall(158088);
}

#End of File, Zone:vexthal  NPC:158014 -- #Diabo_Xi_Va