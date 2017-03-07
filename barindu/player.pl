#BeginFile: barindu\player.pl
#Quest file for Barindu - Viarglug: Spawn Chest during Necromancer Epic 1.5 (Soulwhisper)
sub EVENT_LOOT {
  if (($corpse eq "#Viarglug") && $looted_id == 11174) {  #Whiahdi's Earthly Possessions
	if (defined($qglobals{Soulwhisper}) && $qglobals{Soulwhisper} == 2) {
	  if (!defined($qglobals{nec_epic_barindu})) {
			quest::setglobal("nec_epic_barindu", "1", 5, "F"); 
			$x = $client->GetX();
			$y = $client->GetY();
			$z = $client->GetZ();
			quest::spawn2(283157,0,0,$x,$y,$z,0);
		}
	  return 0;
	}
	else 
	{
		return 1;
	}
  }
}