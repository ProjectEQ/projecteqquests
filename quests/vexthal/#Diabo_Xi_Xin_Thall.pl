# Warder control for 3rd raid target(s) on 1st floor of vexthal

sub EVENT_SPAWN {
	quest::spawn2(158089,0,0,1596.9,23.6,63.1,127.0);
	quest::spawn2(158089,0,0,1596.9,-23.6,63.1,0);
	quest::spawn2(158089,0,0,1557.9,23.6,63.1,127.0);
	quest::spawn2(158089,0,0,1557.9,-23.6,63.1,0);
	quest::spawn2(158089,0,0,1489.6,-17.4,115.6,254.0);
	quest::spawn2(158089,0,0,1489.3,17.4,115.6,128.0);
	quest::spawn2(158089,0,0,1508.4,2.0,115.6,192.0);
}

sub EVENT_DEATH {
  quest::depopall(158089);
}

#End of File, Zone:vexthal  NPC:158012 -- #Diabo_Xi_Xin_Thall