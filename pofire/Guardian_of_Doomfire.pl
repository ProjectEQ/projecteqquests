sub EVENT_SPAWN {
	quest::spawn_condition($zonesn,3,0);
}

sub EVENT_DEATH_COMPLETE {
       	quest::spawn2(217076,0,0,-1499,-935,-182.8,252); # NPC: #Fennin_Ro_the_Tyrant_of_Fire
       	quest::spawn2(217087,0,0,-855.2,-1652.9,-211.5,123.2); # NPC: a_doomfire_ragefiend
	quest::spawn2(217087,0,0,-695.3,-1432.5,-150.5,74); # NPC: a_doomfire_ragefiend
	quest::spawn2(217087,0,0,-539.5,-1601.4,-170.5,425); # NPC: a_doomfire_ragefiend
	quest::spawn2(217088,0,0,-704.2,-1066.6,-150.5,55); # NPC: a_doomfire_darkfiend
	quest::spawn2(217088,0,0,-608.0,-1195.1,-120.5,464.8); # NPC: a_doomfire_darkfiend
	quest::spawn2(217088,0,0,-581.7,-1345.3,-120.9,503.8); # NPC: a_doomfire_darkfiend
	quest::spawn_condition($zonesn,3,1);
      	quest::signal(217076,0); # NPC: #Fennin_Ro_the_Tyrant_of_Fire
}


#End of File  Zone: PoFire  ID: 217050  -- Guardian_of_Doomfire
